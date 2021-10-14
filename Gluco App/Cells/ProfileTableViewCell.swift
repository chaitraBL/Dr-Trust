//
//  ProfileTableViewCell.swift
//  Gluco App
//
//  Created by Anjali on 15/6/21.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {
    @IBOutlet var userid: UILabel!
    
    @IBOutlet var name: UILabel!
    
    @IBOutlet var profileImg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
