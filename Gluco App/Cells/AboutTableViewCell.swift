//
//  AboutTableViewCell.swift
//  Gluco App
//
//  Created by Anjali on 4/6/21.
//

import UIKit

class AboutTableViewCell: UITableViewCell {
    @IBOutlet weak var labelData: UILabel!
    
    @IBOutlet weak var imageIcon: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
