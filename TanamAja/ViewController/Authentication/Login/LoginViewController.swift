//
//  LoginViewController.swift
//  TanamAja
//
//  Created by Gus Adi on 07/03/21.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var emailTextField: DesignableTextField!
    @IBOutlet weak var passTextField: DesignableTextField!
    @IBOutlet weak var loginBtn: UIButton!
    
    private let button = UIButton(type: .custom)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        navigationController?.navigationBar.isHidden = false
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
}
