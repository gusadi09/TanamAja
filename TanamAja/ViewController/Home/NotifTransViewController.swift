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

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = transaksiTable.dequeueReusableCell(withIdentifier: "transaksiCell", for: indexPath) as? NotifTransTableViewCell
        
        return cell!
    }
    
}
