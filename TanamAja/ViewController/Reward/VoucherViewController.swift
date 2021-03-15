//
//  VoucherViewController.swift
//  TanamAja
//
//  Created by Gus Adi on 15/03/21.
//

import UIKit
import SpringIndicator

class VoucherViewController: UIViewController {
    
    @IBOutlet weak var voucherCV: UICollectionView!
    
    var parentNavigationController : UINavigationController?
    let refreshControl = RefreshIndicator()

    override func viewDidLoad() {
        super.viewDidLoad()

        voucherCV.delegate = self
        voucherCV.dataSource = self
        
        voucherCV.register(UINib(nibName: "RewardCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "rewardCell")
        
        let layout = UICollectionViewFlowLayout()
        
        layout.scrollDirection = .vertical
        layout.sectionInset.top = 15
        layout.sectionInset.left = 15
        layout.sectionInset.right = 15
        layout.sectionInset.bottom = 45
        
        voucherCV.collectionViewLayout = layout
        
        voucherCV.addSubview(refreshControl)
        refreshControl.addTarget(self, action: #selector(self.onRefresh), for: .valueChanged)
        
        refreshControl.indicator.lineColor = UIColor(named: "Green")!
    }
    
    @objc func onRefresh() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.refreshControl.endRefreshing()
            self.voucherCV.reloadData()
        }
    }

}

extension VoucherViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = voucherCV.dequeueReusableCell(withReuseIdentifier: "rewardCell", for: indexPath) as? RewardCollectionViewCell 
        
        return item!
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: 170, height: 165)
        }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "MainView", bundle: nil)
        
        let vc = storyboard.instantiateViewController(identifier: "confirmationVC") as? ConfirmRewardViewController
        
        self.parentNavigationController?.pushViewController(vc!, animated: true)
    }
}
