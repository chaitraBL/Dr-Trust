//
//  HelpViewController.swift
//  Gluco App
//
//  Created by Anjali on 4/6/21.
//

import UIKit

class HelpViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    var icon = ["008-phone-call","027-avatar","018-settings", "help", "012-copy"]
    var helpArray = ["Request a call back", "Customer Support","How to use", "Troubleshooting", "Access setup guides"]
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return helpArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Help&Support", for: indexPath) as! HelpTableViewCell
        cell.IconImage.image = UIImage(named: icon[indexPath.row])
        cell.helpLabel.text = helpArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "comming2", sender: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

//        navigationItem.hidesBackButton = true
        // Do any additional setup after loading the view.
    }
    

    

}
