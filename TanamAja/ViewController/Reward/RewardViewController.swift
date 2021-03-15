//
//  RewardViewController.swift
//  TanamAja
//
//  Created by Gus Adi on 08/03/21.
//

import UIKit
import PageMenu

class RewardViewController: UIViewController, CAPSPageMenuDelegate {
    
    @IBOutlet weak var titleLbl: UILabel!
    var pageMenu : CAPSPageMenu?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        segmented()
        
        pageMenu?.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.navigationBar.isHidden = true
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func segmented() {
        var controllerArray : [UIViewController] = []
        
        let storyboard = UIStoryboard(name: "MainView", bundle: nil)
        
        let vc = storyboard.instantiateViewController(identifier: "VoucherVC") as? VoucherViewController
        vc?.parentNavigationController = self.navigationController
        
        vc?.title = "Voucher"
        
        let vc2 = storyboard.instantiateViewController(identifier: "MerchVC") as? MerchandiseViewController
        vc2?.parentNavigationController = self.navigationController
        
        vc2?.title = "Merchandise"
        
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
        let navheight = (navigationController?.navigationBar.frame.height ?? 0) + UIApplication.shared.statusBarFrame.height + titleLbl.frame.height
        let frame = CGRect(x: 0, y: navheight, width: view.frame.width, height: view.frame.height)
        
        pageMenu = CAPSPageMenu(viewControllers: controllerArray, frame: frame, pageMenuOptions: parameters)
        
        pageMenu!.delegate = self
        self.view.addSubview(pageMenu!.view)
        
        pageMenu?.view.snp.makeConstraints({ (make) in
            make.left.equalTo(self.view)
            make.right.equalTo(self.view)
            make.top.equalTo(self.titleLbl.snp.bottom).offset(10)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
        })
    }
}
