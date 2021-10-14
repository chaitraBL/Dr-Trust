//
//  remainderTableViewCell.swift
//  Gluco App
//
//  Created by Anjali on 17/6/21.
//

import UIKit

class remainderTableViewCell: UITableViewCell {
    
    
    @IBOutlet var timeLab: UILabel!
    @IBOutlet var medicine: UILabel!
    
    @IBOutlet var deleteBtn: UIButton!
    @IBOutlet var satBtn: UIButton!
    @IBOutlet var friBtn: UIButton!
    @IBOutlet var thurBtn: UIButton!
    @IBOutlet var tueBtn: UIButton!
    @IBOutlet var wedBtn: UIButton!
    @IBOutlet var monBtn: UIButton!
    @IBOutlet var sunBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
