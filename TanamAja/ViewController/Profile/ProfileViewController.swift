//
//  ProfileViewController.swift
//  TanamAja
//
//  Created by Gus Adi on 08/03/21.
//

import UIKit

class ProfileViewController: UIViewController {
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var phoneLbl: UILabel!
    @IBOutlet weak var pointsLbl: UILabel!
    @IBOutlet weak var logoutBtn: UIButton!
    @IBOutlet weak var profileImage: UIImageView!
    
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
    
    @IBAction func editPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "toEdit", sender: self)
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