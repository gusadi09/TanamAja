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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        emailTextField.layer.masksToBounds = true
                emailTextField.layer.cornerRadius = 4
                emailTextField.layer.borderWidth = 1
        emailTextField.layer.borderColor = UIColor.systemGray3.cgColor
                
                passTextField.layer.masksToBounds = true
                passTextField.layer.cornerRadius = 4
                passTextField.layer.borderWidth = 1
        passTextField.layer.borderColor = UIColor.systemGray3.cgColor
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
