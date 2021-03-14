//
//  SuccesViewController.swift
//  TanamAja
//
//  Created by Gus Adi on 14/03/21.
//

import UIKit

class SuccesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        navigationController?.navigationBar.isHidden = false
    }
    
    func setupUI() {
        
    }
}
