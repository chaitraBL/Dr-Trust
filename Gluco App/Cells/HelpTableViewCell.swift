//
//  HelpTableViewCell.swift
//  Gluco App
//
//  Created by Anjali on 4/6/21.
//

import UIKit

class HelpTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var IconImage: UIImageView!
    @IBOutlet weak var helpLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
