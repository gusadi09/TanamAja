//
//  DetailNotifViewController.swift
//  TanamAja
//
//  Created by Gus Adi on 14/03/21.
//

import UIKit

class DetailNotifViewController: UIViewController {
    @IBOutlet weak var isiLbl: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func closePressed(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
}
