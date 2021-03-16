//
//  MerchandiseViewController.swift
//  TanamAja
//
//  Created by Gus Adi on 15/03/21.
//

import UIKit
import SpringIndicator

class MerchandiseViewController: UIViewController {
    @IBOutlet weak var merchCV: UICollectionView!
    
    var parentNavigationController : UINavigationController?
    
    let refreshControl = RefreshIndicator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        merchCV.delegate = self
        merchCV.dataSource = self
        
        merchCV.register(UINib(nibName: "RewardCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "rewardCell")
        
        let layout = UICollectionViewFlowLayout()
        
        layout.scrollDirection = .vertical
        layout.sectionInset.top = 15
        layout.sectionInset.left = 10
        layout.sectionInset.right = 10
        layout.sectionInset.bottom = 45
        
        merchCV.collectionViewLayout = layout
        
        merchCV.addSubview(refreshControl)
        refreshControl.addTarget(self, action: #selector(self.onRefresh), for: .valueChanged)
        
        refreshControl.indicator.lineColor = UIColor(named: "Green")!
    }
    
    @objc func onRefresh() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.refreshControl.endRefreshing()
            self.merchCV.reloadData()
        }
    }
}

extension MerchandiseViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = merchCV.dequeueReusableCell(withReuseIdentifier: "rewardCell", for: indexPath) as? RewardCollectionViewCell
        
        item?.imageReward.image = UIImage(named: "Intersect")
        
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
