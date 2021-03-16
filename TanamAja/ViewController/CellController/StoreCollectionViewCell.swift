//
//  StoreCollectionViewCell.swift
//  TanamAja
//
//  Created by Gus Adi on 15/03/21.
//

import UIKit

class StoreCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var allView: UIView!
    @IBOutlet weak var imageTitle: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    func setupUI() {
        imageTitle.clipsToBounds = true
        imageTitle.layer.cornerRadius = 5
        imageTitle.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
        allView.clipsToBounds = true
        allView.layer.cornerRadius = 5
        allView.layer.shadowColor = UIColor.black.cgColor
        allView.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        allView.layer.shadowOpacity = 0.1
        allView.layer.shadowRadius = 5
        allView.layer.masksToBounds = false
    }
    
}
