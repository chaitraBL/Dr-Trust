//
//  NotificationsViewController.swift
//  Gluco App
//
//  Created by Anjali on 4/6/21.
//

import UIKit

class NotificationsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var index = 0
    var titleName:String?
    @IBOutlet var notificationTB: UITableView!
    var remainderDetails:[readingData] = []
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return remainderDetails.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "notificationCell", for: indexPath) as! NotificationTableViewCell
        if remainderDetails[indexPath.row].type == 1
        {
            cell.remainderName.text = "Medicine Reminder"
            cell.remainderMessage.text = remainderDetails[indexPath.row].name
            cell.days.text = "1 days ago"
        }
        else if remainderDetails[indexPath.row].type == 2
        {
            cell.remainderName.text = "Bg Reminder"
            cell.remainderMessage.text = remainderDetails[indexPath.row].name
            cell.days.text = "1 days ago"

        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        index = indexPath.row
        let cell = tableView.cellForRow(at: indexPath) as! NotificationTableViewCell
        cell.dotImg.isHidden = true
        titleName = cell.remainderName.text
        cell.remainderName.textColor = .lightGray
        cell.remainderMessage.textColor = .lightGray
        cell.days.textColor = .lightGray
        
//        cell.remainderName
        performSegue(withIdentifier: "FullNotification", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        Networking().viewRemainder(token: newToken!) { [self] (data, error) in
            self.remainderDetails = (data as? [readingData])!
            if self.remainderDetails.count > 0
            {
                self.notificationTB.reloadData()
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "FullNotification"
        {
            let vc = segue.destination as? ViewNotificationViewController
            vc?.notificationTitle = titleName
            vc?.notificationMessage = remainderDetails[index].name
        }
    }
    
    @IBAction func clearAll(_ sender: UIButton) {
        print("Clear Button clicked")
        
        for cell in notificationTB.visibleCells {
              if let questionCell = cell as? NotificationTableViewCell {
                 // Hide your label here.
                questionCell.remainderMessage.isHidden = true
                questionCell.remainderName.isHidden = true

                questionCell.days.isHidden = true
                questionCell.notifyImg.isHidden = true

                questionCell.dotImg.isHidden = true

              }
           }
        
//        for view: UIView in notificationTB.subviews {
//                   for subview: Any in view.subviews {
//                       if (subview is UITableViewCell) {
//                           let cell = subview as? NotificationTableViewCell
//                           // do something with your cell
//
//                        if let questioncell = cell
//                           {
//                            questioncell.remainderName.text = ""
//                            questioncell.remainderName.text = ""
//                            questioncell.days.text = ""
//                            questioncell.dotImg.image = UIImage(named: "")
//                            questioncell.notifyImg.image = UIImage(named: "")
//                           }
//
//                           // you can access any cells
//
//                       }
//                   }
//               }
    }
    

}
