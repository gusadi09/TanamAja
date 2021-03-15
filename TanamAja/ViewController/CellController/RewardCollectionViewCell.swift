//
//  RewardCollectionViewCell.swift
//  TanamAja
//
//  Created by Gus Adi on 15/03/21.
//

import UIKit

class RewardCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var pointLbl: UILabel!
    @IBOutlet weak var imageReward: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    func setupUI() {
        imageReward.clipsToBounds = true
        imageReward.layer.cornerRadius = 20
        imageReward.layer.masksToBounds = false
    }

}
