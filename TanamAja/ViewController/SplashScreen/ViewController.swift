//
//  ViewController.swift
//  TanamAja
//
//  Created by Gus Adi on 07/03/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var startButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        startButton.clipsToBounds = true
        startButton.layer.cornerRadius = 10
        startButton.layer.masksToBounds = false
        
        navigationController?.navigationBar.isHidden = true
    }

    @IBAction func startPressed(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "MainView", bundle: nil)
        
        let vc = storyboard.instantiateViewController(identifier: "LoginVC") as? LoginViewController
        
        self.navigationController?.setViewControllers([vc!], animated: true)
    }
}

