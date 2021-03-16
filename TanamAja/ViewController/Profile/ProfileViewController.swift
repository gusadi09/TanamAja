//
//  ProfileViewController.swift
//  TanamAja
//
//  Created by Gus Adi on 08/03/21.
//

import UIKit
import FirebaseAuth
import Firebase

class ProfileViewController: UIViewController {
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var phoneLbl: UILabel!
    @IBOutlet weak var pointsLbl: UILabel!
    @IBOutlet weak var logoutBtn: UIButton!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var belumDibayarBtn: UIButton!
    @IBOutlet weak var dikirimBtn: UIButton!
    @IBOutlet weak var pesananSelesaiBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.navigationBar.isHidden = true
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        navigationController?.navigationBar.isHidden = false
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func setupUI() {
        profileImage.layer.borderWidth = 3
        profileImage.layer.masksToBounds = false
        profileImage.layer.borderColor = UIColor(named: "Green")?.cgColor
        profileImage.layer.cornerRadius = profileImage.frame.height/2
        profileImage.clipsToBounds = true
        
        logoutBtn.clipsToBounds = true
        logoutBtn.layer.cornerRadius = 5
        logoutBtn.layer.borderWidth = 1
        logoutBtn.layer.borderColor = UIColor.red.cgColor
        logoutBtn.layer.masksToBounds = false
    }
    
    @IBAction func orderDonePressed(_ sender: UIButton) {
    }
    
    @IBAction func dikirimPressed(_ sender: UIButton) {
    }
    
    @IBAction func notPayPressed(_ sender: UIButton) {
    }
    
    @IBAction func editPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "toEdit", sender: self)
    }
    
    @IBAction func logoutPressed(_ sender: UIButton) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dest = segue.destination as? EditProfileViewController
        
        if segue.identifier == "toEdit" {
            if let img = profileImage.image, let nama = nameLbl.text, let phone = phoneLbl.text {
                dest?.img = img
                dest?.nama = nama
                dest?.phone = phone
            }
        }
    }
}
