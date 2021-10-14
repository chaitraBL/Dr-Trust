//
//  ProgressCollectionViewCell.swift
//  Gluco App
//
//  Created by Anjali on 14/7/21.
//

import UIKit
import MBCircularProgressBar

class ProgressCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var progressView: MBCircularProgressBarView!
    
    @IBOutlet weak var progressView1: MBCircularProgressBarView!
    @IBOutlet var weeklyAvg: UILabel!
    @IBOutlet var latestResult: UILabel!
}
