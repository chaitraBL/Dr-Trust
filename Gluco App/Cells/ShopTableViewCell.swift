//
//  ShopTableViewCell.swift
//  Gluco App
//
//  Created by Anjali on 4/6/21.
//

import UIKit

class ShopTableViewCell: UITableViewCell {
    @IBOutlet weak var cartImg: UIImageView!
    @IBOutlet weak var cartDiscount: UILabel!
    @IBOutlet weak var cartPrice: UILabel!
    @IBOutlet weak var actualPrice: UILabel!
    
    @IBOutlet weak var name: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
