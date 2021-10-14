//
//  ViewNotificationViewController.swift
//  Gluco App
//
//  Created by Anjali on 4/6/21.
//

import UIKit

class ViewNotificationViewController: UIViewController {

    var notificationTitle:String?
    var notificationMessage:String?
    
    @IBOutlet var remainderTitle: UILabel!
    @IBOutlet var remainderMessage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        remainderTitle.text = notificationTitle
        remainderMessage.text = notificationMessage
    }
    

   

}
