//
//  HomeViewController.swift
//  TanamAja
//
//  Created by Gus Adi on 08/03/21.
//

import UIKit
import SpringIndicator

class HomeViewController: UIViewController {
    @IBOutlet weak var scrollHomeView: UIScrollView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var notifBtn: UIButton!
    @IBOutlet weak var dTaskView: UIView!
    @IBOutlet weak var dTaskTable: UITableView!
    @IBOutlet weak var pointLbl: UILabel!
    @IBOutlet weak var tipsCollection: UICollectionView!
    
    let refreshControl = RefreshIndicator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        navigationItem.backButtonTitle = ""
        dTaskTable.dataSource = self
        dTaskTable.delegate = self
        
        dTaskTable.register(UINib(nibName: "DailyTaskTableViewCell", bundle: nil), forCellReuseIdentifier: "dTaskCell")
        
        tipsCollection.dataSource = self
        tipsCollection.delegate = self
        
        tipsCollection.register(UINib(nibName: "TipsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "tipsCell")
        
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.navigationBar.isHidden = true
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func setupUI() {
        scrollHomeView.addSubview(refreshControl)
        refreshControl.addTarget(self, action: #selector(self.onRefresh), for: .valueChanged)
        
        refreshControl.indicator.lineColor = UIColor(named: "Green")!
        
        dTaskView.clipsToBounds = true
        dTaskView.layer.cornerRadius = 5
        dTaskView.layer.masksToBounds = false
        
        
        
        tabBarController?.tabBar.backgroundImage = UIImage()
        tabBarController?.tabBar.shadowImage = UIImage()
        tabBarController?.tabBar.backgroundColor = .white
    }
    
    @objc func onRefresh() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
            self.refreshControl.endRefreshing()
        }
    }
    
    @IBAction func notificationPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "toNotif", sender: self)
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = dTaskTable.dequeueReusableCell(withIdentifier: "dTaskCell", for: indexPath) as? DailyTaskTableViewCell
        
        return cell!
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let items = tipsCollection.dequeueReusableCell(withReuseIdentifier: "tipsCell", for: indexPath) as? TipsCollectionViewCell
        
        return items!
    }
}
