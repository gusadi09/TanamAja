//
//  ConfirmRewardViewController.swift
//  TanamAja
//
//  Created by Gus Adi on 15/03/21.
//

import UIKit

class ConfirmRewardViewController: UIViewController {
    @IBOutlet weak var allView: UIView!
    @IBOutlet weak var redeemBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redeemBtn.clipsToBounds = true
        redeemBtn.layer.cornerRadius = 10
        redeemBtn.layer.masksToBounds = false
        
        allView.clipsToBounds = true
        allView.layer.cornerRadius = 5
        allView.layer.shadowColor = UIColor.black.cgColor
        allView.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        allView.layer.shadowOpacity = 0.1
        allView.layer.shadowRadius = 12
        allView.layer.masksToBounds = false
        
        navigationItem.backButtonTitle = ""
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.backgroundColor = .white
        
        navigationController?.navigationBar.backIndicatorImage = UIImage(named: "back")
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "back")
        
        let container = UIView(frame: CGRect(x: 0, y: 0, width: 1000, height: 28))
        
        let title = UILabel()
        title.text = "Confirmation"
        title.textColor = UIColor(named: "Green")
        title.font = UIFont(name: "Poppins-Bold", size: 30)
        title.translatesAutoresizingMaskIntoConstraints = false
        container.addSubview(title)
        
        let leftWidth: CGFloat = 55 // left padding
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
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        navigationController?.navigationBar.isHidden = true
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    @IBAction func redeemPressed(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "MainView", bundle: nil)
        
        let vc = storyboard.instantiateViewController(identifier: "SuccesVC") as? SuccesViewController
        
        navigationController?.pushViewController(vc!, animated: true)
    }
}
