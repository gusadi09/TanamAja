//
//  NotifOtherViewController.swift
//  TanamAja
//
//  Created by Gus Adi on 08/03/21.
//

import UIKit

class NotifOtherViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var otherTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        otherTable.delegate = self
        otherTable.dataSource = self
        
        otherTable.register(UINib(nibName: "NotifOtherTableViewCell", bundle: nil), forCellReuseIdentifier: "otherCell")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = otherTable.dequeueReusableCell(withIdentifier: "otherCell", for: indexPath) as? NotifOtherTableViewCell
        
        return cell!
    }
}
