//
//  RewardViewController.swift
//  TanamAja
//
//  Created by Gus Adi on 08/03/21.
//

import UIKit
import ExpandableCell

class RewardViewController: UIViewController {
    @IBOutlet weak var exchangeTable: ExpandableTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        exchangeTable.expandableDelegate = self
        exchangeTable.animation = .automatic
        
        exchangeTable.register(UINib(nibName: "ExchangeTableViewCell", bundle: nil), forCellReuseIdentifier: "exchangeCell")
        exchangeTable.register(UINib(nibName: "SubExchangeTableViewCell", bundle: nil), forCellReuseIdentifier: "subExCell")
    }
}

extension RewardViewController: ExpandableDelegate {
    func expandableTableView(_ expandableTableView: ExpandableTableView, heightsForExpandedRowAt indexPath: IndexPath) -> [CGFloat]? {
        switch indexPath.section {
        case 0:
            return[297]
        default:
            return[297]
        }
    }
    
    func expandableTableView(_ expandableTableView: ExpandableTableView, expandedCellsForRowAt indexPath: IndexPath) -> [UITableViewCell]? {
        let subCell = expandableTableView.dequeueReusableCell(withIdentifier: "subExCell", for: indexPath) as? SubExchangeTableViewCell
        
        switch indexPath.section {
        case 0:
            return[subCell!]
        default:
            return[subCell!]
        }
    }
    
    func expandableTableView(_ expandableTableView: ExpandableTableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 108
    }
    
    func expandableTableView(_ expandableTableView: ExpandableTableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func expandableTableView(_ expandableTableView: ExpandableTableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = expandableTableView.dequeueReusableCell(withIdentifier: "exchangeCell", for: indexPath) as? ExchangeTableViewCell
        
        return cell!
    }
    
    func expandableTableView(_ expandableTableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return true
    }
}
