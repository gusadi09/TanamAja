//
//  SubExchangeTableViewCell.swift
//  TanamAja
//
//  Created by Gus Adi on 08/03/21.
//

import UIKit

class SubExchangeTableViewCell: UITableViewCell {
    @IBOutlet weak var nominalLbl: UILabel!
    @IBOutlet weak var arrowImage: UIImageView!
    @IBOutlet weak var hargaLbl: UILabel!
    @IBOutlet weak var openNominal: UIButton!
    @IBOutlet weak var redeemButton: UIButton!
    @IBOutlet weak var phoneTxtField: UITextField!
    
    let thickness: CGFloat = 1.0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        redeemButton.clipsToBounds = true
        redeemButton.layer.cornerRadius = 5
        redeemButton.layer.masksToBounds = false
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
