//
//  EditProfileViewController.swift
//  TanamAja
//
//  Created by Gus Adi on 08/03/21.
//

import UIKit

class EditProfileViewController: UIViewController {
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var saveBtn: UIButton!
    @IBOutlet weak var phoneText: UITextField!
    
    var img = UIImage()
    var nama = ""
    var phone = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileImage.image = img
        nameText.text = nama
        phoneText.text = phone
        
        setUI()
    }
    
    func setUI() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.backgroundColor = .white
        
        navigationController?.navigationBar.backIndicatorImage = UIImage(named: "back")
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "back")
        
        let container = UIView(frame: CGRect(x: 0, y: 0, width: 1000, height: 28))
        
        let title = UILabel()
        title.text = "Edit Profile"
        title.textColor = UIColor(named: "Green")
        title.font = UIFont(name: "Poppins-Bold", size: 30)
        title.translatesAutoresizingMaskIntoConstraints = false
        container.addSubview(title)
        
        let leftWidth: CGFloat = 60 // left padding
        let rightWidth: CGFloat = 75 // right padding
        let width = view.frame.width - leftWidth - rightWidth
        let offset = (rightWidth - leftWidth) / 2
        
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: container.topAnchor, constant: -10),
            title.bottomAnchor.constraint(equalTo: container.bottomAnchor),
            title.centerXAnchor.constraint(equalTo: container.centerXAnchor, constant: -offset),
            title.widthAnchor.constraint(equalToConstant: width)
        ])
        
        self.navigationItem.titleView = container
        
        profileImage.layer.borderWidth = 2
        profileImage.layer.masksToBounds = false
        profileImage.layer.borderColor = UIColor(named: "Green")?.cgColor
        profileImage.layer.cornerRadius = profileImage.frame.height/2
        profileImage.clipsToBounds = true
        
        saveBtn.clipsToBounds = true
        saveBtn.layer.cornerRadius = 5
        saveBtn.layer.shadowColor = UIColor(named: "Green")?.cgColor
        saveBtn.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        saveBtn.layer.shadowOpacity = 0.25
        saveBtn.layer.shadowRadius = 12
        saveBtn.layer.masksToBounds = false
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        navigationController?.navigationBar.isHidden = true
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    @IBAction func editPicturePress(_ sender: UIButton) {
    }
    
    @IBAction func savePressed(_ sender: UIButton) {
    }
}
