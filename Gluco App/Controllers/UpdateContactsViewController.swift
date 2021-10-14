//
//  UpdateContactsViewController.swift
//  Gluco App
//
//  Created by Anjali on 25/6/21.
//

import UIKit

class UpdateContactsViewController: UIViewController {

    var id:Int?
    var name:String?
    var email:String?
    var phone:String?
    var address1:String?
    var address2:String?
    var pincode:Int?
    var uid:String?
    var type:Int?
    var index = 0
    @IBOutlet var userName: UITextField!
    @IBOutlet var emailId: UITextField!
    @IBOutlet var phoneNumber: UITextField!
    @IBOutlet var addr1: UITextField!
    @IBOutlet var addr2: UITextField!
    @IBOutlet var code: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        userName.text = name
        emailId.text = email
        phoneNumber.text = phone
        addr1.text = address1
        addr2.text = address2
        code.text = String(pincode!)
    }
    
    @IBAction func update(_ sender: UIButton) {
        
        if index == 3 && type == 1
            {
            if emailId.text?.isValidEmail == true || phoneNumber.text?.isValidPhone == true
            {
            Networking().updateContacts(uid: uid!, name: userName.text!, type: 1 , mobile: phoneNumber.text!, email: emailId.text!, address: addr2.text!, id: id!, token: newToken!) { (data, error) in
            if let obj = data as? NSDictionary
            {
                print("updated")
            }
        }
            }
            else{
                alert(msg: "Please type the valid email or phone number")
            }
    }
        else if index == 5 && type == 2
        {
            if emailId.text?.isValidEmail == true || phoneNumber.text?.isValidPhone == true
            {
            Networking().updateContacts(uid: uid!, name: userName.text!, type: type! , mobile: phoneNumber.text!, email: emailId.text!, address: addr2.text!, id: id!, token: newToken!) { (data, error) in
                if let obj = data as? NSDictionary
                {
                    print("updated")
                }
            }

        
        }
        else{
            alert(msg: "Please type the valid email or phone number")
        }
    }
    }
        
    
    func alert(msg:String)
    {
        let alert = UIAlertController(title: "Alert!", message: msg, preferredStyle: .alert)
        let okay = UIAlertAction(title: "Yes", style: .default,handler: nil)
        let no = UIAlertAction(title: "No", style: .default, handler: nil)
            
        alert.addAction(okay)
        alert.addAction(no)
        present(alert, animated: true, completion: nil)
}
    
}
