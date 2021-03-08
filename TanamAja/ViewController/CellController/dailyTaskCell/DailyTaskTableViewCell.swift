//
//  DailyTaskTableViewCell.swift
//  TanamAja
//
//  Created by Gus Adi on 08/03/21.
//

import UIKit

class DailyTaskTableViewCell: UITableViewCell {
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var doneIcon: UIImageView!
    @IBOutlet weak var taskLbl: UILabel!
    @IBOutlet weak var pointLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cellView.clipsToBounds = true
        cellView.layer.cornerRadius = 5
        cellView.layer.masksToBounds = false
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
