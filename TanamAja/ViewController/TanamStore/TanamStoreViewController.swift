//
//  TanamStoreViewController.swift
//  TanamAja
//
//  Created by Gus Adi on 16/03/21.
//

import UIKit
import SnapKit
import SpringIndicator

class TanamStoreViewController: UIViewController {
    @IBOutlet weak var cartBtn: UIButton!
    @IBOutlet weak var searchField: UISearchBar!
    @IBOutlet weak var storeCV: UICollectionView!
    
    let refreshControl = RefreshIndicator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        storeCV.delegate = self
        storeCV.dataSource = self
        storeCV.register(UINib(nibName: "StoreCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "storeCell")
        
        let layout = UICollectionViewFlowLayout()
        
        layout.scrollDirection = .vertical
        layout.sectionInset.top = 5
        layout.sectionInset.left = 10
        layout.sectionInset.right = 10
        layout.sectionInset.bottom = 15
        
        storeCV.collectionViewLayout = layout
        
        storeCV.addSubview(refreshControl)
        refreshControl.addTarget(self, action: #selector(self.onRefresh), for: .valueChanged)
        
        refreshControl.indicator.lineColor = UIColor(named: "Green")!
        
        self.searchField.setSearchFieldBackgroundImage(UIImage(), for: .normal)
        self.searchField.searchTextField.layer.borderWidth = 1
        self.searchField.searchTextField.layer.borderColor = UIColor.black.cgColor
        self.searchField.searchTextField.layer.cornerRadius = 10
        self.searchField.searchTextField.layer.backgroundColor = UIColor.white.cgColor
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    @objc func onRefresh() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.refreshControl.endRefreshing()
            self.storeCV.reloadData()
        }
    }
    
    @IBAction func cartPressed(_ sender: UIButton) {
    }
}

extension TanamStoreViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = storeCV.dequeueReusableCell(withReuseIdentifier: "storeCell", for: indexPath) as? StoreCollectionViewCell
        
        return item!
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 170, height: 200)
    }
}
