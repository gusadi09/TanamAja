//
//  Checkmark.swift
//  TanamAja
//
//  Created by Gus Adi on 07/03/21.
//

import Foundation

import UIKit

class Checkmark: UIButton {
    //Image uncheck dan check
    let checkedImage = UIImage(named: "checkmark")! as UIImage
    let uncheckedImage = UIImage(named: "checkmark_empty")! as UIImage

    //Pengecekan Properti
    var isChecked : Bool = false {
        didSet {
            if isChecked == true {
                self.setImage(checkedImage, for: .normal)
            } else {
                self.setImage(uncheckedImage, for: .normal)
            }
        }
    }
    
    override func awakeFromNib() {
        self.addTarget(self, action: #selector(buttonClicked(sender:)), for: UIControl.Event.touchUpInside)
        self.isChecked = false
    }
    
    @objc func buttonClicked(sender: UIButton) {
        if sender == self {
            isChecked = !isChecked
        }
    }
}
