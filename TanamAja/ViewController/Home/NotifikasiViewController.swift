//
//  NotifikasiViewController.swift
//  TanamAja
//
//  Created by Gus Adi on 08/03/21.
//

import UIKit
import SnapKit
import PageMenu

class NotifikasiViewController: UIViewController, CAPSPageMenuDelegate {
    
    var pageMenu : CAPSPageMenu?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        segmented()
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
    
    func setupUI() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.backgroundColor = .white
        
        navigationController?.navigationBar.backIndicatorImage = UIImage(named: "back")
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "back")
        
        let container = UIView(frame: CGRect(x: 0, y: 0, width: 1000, height: 28))
        
        let title = UILabel()
        title.text = "Notifikasi"
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
    }
    
    func segmented() {
        var controllerArray : [UIViewController] = []
        
        let storyboard = UIStoryboard(name: "MainView", bundle: nil)
        
        let vc = storyboard.instantiateViewController(identifier: "transaksiVC") as? NotifTransViewController
        vc?.title = "TRANSACTION"
        let vc2 = storyboard.instantiateViewController(identifier: "otherVC") as? NotifOtherViewController
        vc2?.title = "OTHER"
        
        controllerArray.append(vc!)
        controllerArray.append(vc2!)
        
        let parameters: [CAPSPageMenuOption] = [
            .menuItemSeparatorWidth(0),
            .useMenuLikeSegmentedControl(true),
            .selectionIndicatorColor(UIColor(named: "Green")!),
            .unselectedMenuItemLabelColor(UIColor.black),
            .scrollMenuBackgroundColor(.white),
            .menuMargin(20.0),
            .menuHeight(40.0),
            .selectedMenuItemLabelColor(UIColor(named: "Green")!),
            .menuItemFont(UIFont(name: "Poppins-Regular", size: 16)!)
        ]
        let navheight = (navigationController?.navigationBar.frame.height ?? 0) + UIApplication.shared.statusBarFrame.height
        let frame = CGRect(x: 0, y: navheight, width: view.frame.width, height: view.frame.height)
        
        pageMenu = CAPSPageMenu(viewControllers: controllerArray, frame: frame, pageMenuOptions: parameters)
        
        pageMenu!.delegate = self
        self.view.addSubview(pageMenu!.view)
    }
}
