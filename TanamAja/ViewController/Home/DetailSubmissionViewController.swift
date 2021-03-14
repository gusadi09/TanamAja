//
//  DetailSubmissionViewController.swift
//  TanamAja
//
//  Created by Gus Adi on 14/03/21.
//

import UIKit

class DetailSubmissionViewController: UIViewController {
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descLbl: UILabel!
    @IBOutlet weak var imageTask: UIImageView!
    @IBOutlet weak var addSubmissionBtn: UIButton!
    @IBOutlet weak var inputLbl: UILabel!
    
    var titleTxt = ""
    var descTxt = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        navigationItem.backButtonTitle = ""
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        //navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    func setupUI() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.backgroundColor = .white
        
        navigationController?.navigationBar.backIndicatorImage = UIImage(named: "back")
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "back")
        
        let container = UIView(frame: CGRect(x: 0, y: 0, width: 1000, height: 28))
        
        let title = UILabel()
        title.text = "Task Details"
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
        
        addSubmissionBtn.clipsToBounds = true
        addSubmissionBtn.layer.cornerRadius = 5
        addSubmissionBtn.layer.shadowColor = UIColor(named: "Green")?.cgColor
        addSubmissionBtn.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        addSubmissionBtn.layer.shadowOpacity = 0.25
        addSubmissionBtn.layer.shadowRadius = 12
        addSubmissionBtn.layer.masksToBounds = false
        
        titleLbl.text = titleTxt
    }
    
    @IBAction func addSubmissionPressed(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "MainView", bundle: nil)
        
        let vc = storyboard.instantiateViewController(identifier: "CameraVC") as? CameraViewController
        
        navigationController?.pushViewController(vc!, animated: true)
    }
}
