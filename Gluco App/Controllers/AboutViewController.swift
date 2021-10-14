//
//  AboutViewController.swift
//  Gluco App
//
//  Created by Anjali on 4/6/21.
//

import UIKit

class AboutViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var icon = ["027-avatar","025-like", "009-reload", "032-success","012-copy"]
    var helpArray = ["About Us", "Rate Us","Report a Problem", "Privacy Policy", "Terms & Conditions"]
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return helpArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "About", for: indexPath) as! AboutTableViewCell
        cell.imageIcon.image = UIImage(named: icon[indexPath.row])
        cell.labelData.text = helpArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
        
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "comming1", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

   

}
