//
//  NotificationTableViewCell.swift
//  Gluco App
//
//  Created by Anjali on 26/6/21.
//

import UIKit

class NotificationTableViewCell: UITableViewCell {

    @IBOutlet var notifyImg: UIImageView!
    @IBOutlet var remainderName: UILabel!
    @IBOutlet var days: UILabel!
    @IBOutlet var dotImg: UIImageView!
    
    @IBOutlet var remainderMessage: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
