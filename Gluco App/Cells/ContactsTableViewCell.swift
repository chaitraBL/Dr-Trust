//
//  ContactsTableViewCell.swift
//  Gluco App
//
//  Created by Anjali on 16/6/21.
//

import UIKit

class ContactsTableViewCell: UITableViewCell {
    
    @IBOutlet var name: UILabel!
    
    @IBOutlet var initialImg: UIImageView!
    @IBOutlet var email: UILabel!
    @IBOutlet var phone: UILabel!
    @IBOutlet var address: UILabel!
    
    @IBOutlet var edit: UIButton!
    @IBOutlet var remove: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
