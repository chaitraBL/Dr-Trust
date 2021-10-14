//
//  ViewDataReadingViewController.swift
//  Gluco App
//
//  Created by Anjali on 24/6/21.
//

import UIKit

class ViewDataReadingViewController: UIViewController {

    var reading:Int?
    var status:String?
    var date:String?
    
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var statusLabel: UILabel!
    @IBOutlet var readingLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        readingLabel.text = String(reading!) + "mg/dL"
        statusLabel.text = status
        dateLabel.text = date
        
    }
    
    @IBAction func shareData(_ sender: UIButton) {
//        let items = [profileImageView.image]
//        let ac = UIActivityViewController(activityItems: items, applicationActivities: nil)
//        present(ac, animated: true)
        // text to share
        let text = "Blood Glucose Reading: " + readingLabel.text!
                
                // set up activity view controller
                let textToShare = [ text ]
                let activityViewController = UIActivityViewController(activityItems: textToShare, applicationActivities: nil)
                activityViewController.popoverPresentationController?.sourceView = self.view // so that iPads won't crash
                
                // exclude some activity types from the list (optional)
                activityViewController.excludedActivityTypes = [ UIActivity.ActivityType.airDrop, UIActivity.ActivityType.postToFacebook ]
                
                // present the view controller
                self.present(activityViewController, animated: true, completion: nil)
    }
    
    @IBAction func cancel(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
