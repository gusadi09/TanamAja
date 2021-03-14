//
//  NotifTableViewController.swift
//  TanamAja
//
//  Created by Gus Adi on 08/03/21.
//

import UIKit

class NotifTransViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var transaksiTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        transaksiTable.delegate = self
        transaksiTable.dataSource = self
        
        transaksiTable.register(UINib(nibName: "NotifTransTableViewCell", bundle: nil), forCellReuseIdentifier: "transaksiCell")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        navigationController?.navigationBar.isHidden = false
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = transaksiTable.dequeueReusableCell(withIdentifier: "transaksiCell", for: indexPath) as? NotifTransTableViewCell
        
        cell?.selectionStyle = .none
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "MainView", bundle: nil)
        
        let vc = storyboard.instantiateViewController(identifier: "DetailNotifVC") as? DetailNotifViewController
        
        present(vc!, animated: true, completion: nil)
    }
}
