//
//  SuccesViewController.swift
//  TanamAja
//
//  Created by Gus Adi on 14/03/21.
//

import UIKit

class SuccesViewController: UIViewController {
    @IBOutlet weak var badgeImg: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descLbl: UILabel!
    @IBOutlet weak var backBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func setupUI() {
        backBtn.clipsToBounds = true
        backBtn.layer.cornerRadius = 5
        backBtn.layer.shadowColor = UIColor(named: "Green")?.cgColor
        backBtn.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        backBtn.layer.shadowOpacity = 0.25
        backBtn.layer.shadowRadius = 12
        backBtn.layer.masksToBounds = false
    }
    
    @IBAction func backPressed(_ sender: UIButton) {
        let controllers : Array = self.navigationController!.viewControllers
        self.navigationController!.popToViewController(controllers[1], animated: true)
    }
}
