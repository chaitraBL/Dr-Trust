//
//  LogsTableViewCell.swift
//  Gluco App
//
//  Created by Anjali on 23/6/21.
//

import UIKit

class LogsTableViewCell: UITableViewCell {

    @IBOutlet var dateLabel: UILabel!
    
    @IBOutlet var fastingLabel: UIButton!
    
    @IBOutlet var randomLabel: UIButton!
    @IBOutlet var postMealLabel: UIButton!
    @IBOutlet var preMealLabel: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
