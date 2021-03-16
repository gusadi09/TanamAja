//
//  LoginViewController.swift
//  TanamAja
//
//  Created by Gus Adi on 07/03/21.
//

import UIKit
import CryptoKit
import FirebaseAuth
import Firebase
import FirebaseFirestore
import AuthenticationServices
import SpringIndicator
import SnapKit
import GoogleSignIn
import IQKeyboardManagerSwift

class LoginViewController: UIViewController {
    @IBOutlet weak var emailTextField: DesignableTextField!
    @IBOutlet weak var passTextField: DesignableTextField!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var appleLoginBtn: ASAuthorizationAppleIDButton!
    @IBOutlet weak var googleLoginBtn: GIDSignInButton!
    @IBOutlet weak var indicator: SpringIndicator!
    @IBOutlet weak var spinView: UIView!
    
    private let button = UIButton(type: .custom)
    fileprivate var currentNonce: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        spinView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        spinView.clipsToBounds = true
        spinView.layer.cornerRadius = 10
        spinView.layer.masksToBounds = false
        spinView.isHidden = true
        
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance().delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        spinView.isHidden = true
        navigationController?.navigationBar.isHidden = true
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        navigationController?.navigationBar.isHidden = false
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func setupUI() {
        //MARK: TextField Setup
        emailTextField.layer.masksToBounds = true
        emailTextField.layer.cornerRadius = 4
        emailTextField.layer.borderWidth = 1
        emailTextField.layer.borderColor = UIColor.systemGray3.cgColor
        
        passTextField.layer.masksToBounds = true
        passTextField.layer.cornerRadius = 4
        passTextField.layer.borderWidth = 1
        passTextField.layer.borderColor = UIColor.systemGray3.cgColor
        
        button.setImage(UIImage(named: "look"), for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -16, bottom: 0, right: 15)
        button.frame = CGRect(x: CGFloat(passTextField.frame.size.width - 25), y: CGFloat(5), width: CGFloat(25), height: CGFloat(25))
        button.addTarget(self, action: #selector(self.openPass), for: .touchUpInside)
        passTextField.rightView = button
        passTextField.rightViewMode = .always
        
        //MARK: LoginBtn Setup
        loginBtn.clipsToBounds = true
        loginBtn.layer.cornerRadius = 5
        loginBtn.layer.shadowColor = UIColor(named: "Green")?.cgColor
        loginBtn.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        loginBtn.layer.shadowOpacity = 0.25
        loginBtn.layer.shadowRadius = 12
        loginBtn.layer.masksToBounds = false
        
        //MARK: NavigationBar Setup
        navigationItem.backButtonTitle = ""
    }
    
    @IBAction func openPass(_ sender: Any) {
        if passTextField.isSecureTextEntry {
            passTextField.isSecureTextEntry = false
            button.setImage(UIImage(named: "lookclick"), for: .normal)
        } else {
            passTextField.isSecureTextEntry = true
            button.setImage(UIImage(named: "look"), for: .normal)
        }
    }
    
    @IBAction func moveToRegister(_ sender: UIButton) {
        performSegue(withIdentifier: "toRegister", sender: self)
    }
    
    @IBAction func loginPressed(_ sender: UIButton) {
        DispatchQueue.main.async {
            self.spinView.isHidden = false
            self.indicator.start()
        }
        if let email = emailTextField.text, let password = passTextField.text {
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                
                if (error != nil) {
                    print(error?.localizedDescription ?? "")
                    return
                }
                
                guard let user = authResult?.user else { return }
                let email = user.email ?? ""
                let displayName = user.displayName ?? ""
                let phone = user.phoneNumber ?? ""
                let point = 0
                guard let uid = Auth.auth().currentUser?.uid else { return }
                let db = Firestore.firestore()
                        
                self.indicator.stop()
                        
                self.performSegue(withIdentifier: "toHome", sender: self)
            }
        }
    }
    
    @IBAction func googleLoginPressed(_ sender: Any) {
        GIDSignIn.sharedInstance().signIn()
    }
    
    @IBAction func appleLoginPressed(_ sender: UIButton) {
        let nonce = randomNonceString()
        currentNonce = nonce
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        request.requestedScopes = [.fullName, .email]
        request.nonce = sha256(nonce)
        
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.presentationContextProvider = self
        authorizationController.performRequests()
    }
}

@available(iOS 13.0, *)
extension LoginViewController: ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding {
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return self.view.window!
    }
    
    private func randomNonceString(length: Int = 32) -> String {
        precondition(length > 0)
        let charset: Array<Character> =
            Array("0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._")
        var result = ""
        var remainingLength = length
        
        while remainingLength > 0 {
            let randoms: [UInt8] = (0 ..< 16).map { _ in
                var random: UInt8 = 0
                let errorCode = SecRandomCopyBytes(kSecRandomDefault, 1, &random)
                if errorCode != errSecSuccess {
                    fatalError("Unable to generate nonce. SecRandomCopyBytes failed with OSStatus \(errorCode)")
                }
                return random
            }
            
            randoms.forEach { random in
                if remainingLength == 0 {
                    return
                }
                
                if random < charset.count {
                    result.append(charset[Int(random)])
                    remainingLength -= 1
                }
            }
        }
        
        return result
    }
    
    @available(iOS 13, *)
    private func sha256(_ input: String) -> String {
        let inputData = Data(input.utf8)
        let hashedData = SHA256.hash(data: inputData)
        let hashString = hashedData.compactMap {
            return String(format: "%02x", $0)
        }.joined()
        
        return hashString
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
            guard let nonce = currentNonce else {
                fatalError("Invalid state: A login callback was received, but no login request was sent.")
            }
            guard let appleIDToken = appleIDCredential.identityToken else {
                print("Unable to fetch identity token")
                return
            }
            guard let idTokenString = String(data: appleIDToken, encoding: .utf8) else {
                print("Unable to serialize token string from data: \(appleIDToken.debugDescription)")
                return
            }
            let credential = OAuthProvider.credential(withProviderID: "apple.com",
                                                      idToken: idTokenString,
                                                      rawNonce: nonce)
            Auth.auth().signIn(with: credential) { (authResult, error) in
                
                DispatchQueue.main.async {
                    self.spinView.isHidden = false
                    self.indicator.start()
                }
                
                if (error != nil) {
                    print(error?.localizedDescription ?? "")
                    return
                }
                
                guard let user = authResult?.user else { return }
                let email = user.email ?? ""
                let displayName = user.displayName ?? ""
                let phone = user.phoneNumber ?? ""
                let point = 0
                guard let uid = Auth.auth().currentUser?.uid else { return }
                let db = Firestore.firestore()
                db.collection("users").document(uid).setData([
                    "email": email,
                    "displayName": displayName,
                    "phoneNumber": phone,
                    "points": point,
                    "uid": uid
                ]) { err in
                    if let err = err {
                        print("Error writing document: \(err)")
                    } else {
                        print("the user has sign up or is logged in")
                        
                        self.indicator.stop()
                        
                        self.performSegue(withIdentifier: "toHome", sender: self)
                    }
                }
            }
        }
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        // Handle error.
        print("Sign in with Apple errored: \(error)")
    }
}

extension LoginViewController: GIDSignInDelegate {
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            print(error.localizedDescription)
            return
        }
        guard let auth = user.authentication else { return }
        let credentials = GoogleAuthProvider.credential(withIDToken: auth.idToken, accessToken: auth.accessToken)
        Auth.auth().signIn(with: credentials) { (authResult, error) in
            DispatchQueue.main.async {
                self.spinView.isHidden = false
                self.indicator.start()
            }
            
            if let error = error {
                print(error.localizedDescription)
            } else {
                print("Login Successful.")
                //This is where you should add the functionality of successful login
                //i.e. dismissing this view or push the home view controller etc
                guard let user = authResult?.user else { return }
                let email = user.email ?? ""
                let displayName = user.displayName ?? ""
                let phone = user.phoneNumber ?? ""
                let point = 0
                guard let uid = Auth.auth().currentUser?.uid else { return }
                let db = Firestore.firestore()
                db.collection("users").document(uid).setData([
                    "email": email,
                    "displayName": displayName,
                    "phoneNumber": phone,
                    "points": point,
                    "uid": uid
                ]) { err in
                    if let err = err {
                        print("Error writing document: \(err)")
                    } else {
                        print("the user has sign up or is logged in")
                        
                        self.indicator.stop()
                        
                        self.performSegue(withIdentifier: "toHome", sender: self)
                    }
                }
            }
        }
        
    }
}
