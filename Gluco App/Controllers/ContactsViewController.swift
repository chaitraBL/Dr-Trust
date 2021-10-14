//
//  ContactsViewController.swift
//  Gluco App
//
//  Created by Anjali on 4/6/21.
//

import UIKit

class ContactsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIPopoverPresentationControllerDelegate {
    
    var index1 = 0
    @IBOutlet var contactsTB: UITableView!
    var contact:[contactDetails] = []
    var contacts = 0
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contact.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactsCell", for: indexPath) as! ContactsTableViewCell
        
        
        let lblNameInitialize = UILabel()
            lblNameInitialize.frame.size = CGSize(width: 100.0, height: 100.0)
            lblNameInitialize.textColor = UIColor.white
        lblNameInitialize.font = UIFont.boldSystemFont(ofSize: 40)
        lblNameInitialize.text = String((cell.name.text?.first)!)
            lblNameInitialize.textAlignment = NSTextAlignment.center
            lblNameInitialize.backgroundColor = UIColor(hexString: "#544F9F")
            lblNameInitialize.layer.cornerRadius = 50.0

            UIGraphicsBeginImageContext(lblNameInitialize.frame.size)
            lblNameInitialize.layer.render(in: UIGraphicsGetCurrentContext()!)
        cell.initialImg.image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()

//        cell.initialImg.image = imageWith(name: cell.name.text)
        

        cell.name.text = contact[indexPath.row].name
        cell.phone.text = contact[indexPath.row].mobile
        cell.email.text = contact[indexPath.row].email
        let addr = contact[indexPath.row].address1! + "," + contact[indexPath.row].address2! + "-" + String(contact[indexPath.row].pincode!)
        cell.address.text = addr
        cell.remove.addTarget(self, action: #selector(action(sender:)), for: .touchUpInside)
        cell.remove.tag = indexPath.row
        cell.edit.addTarget(self, action: #selector(action1(sender:)), for: .touchUpInside)
        cell.edit.tag = indexPath.row
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 350
    }
    
    func imageWith(name: String?) -> UIImage? {
         let frame = CGRect(x: 0, y: 0, width: 100, height: 100)
         let nameLabel = UILabel(frame: frame)
         nameLabel.textAlignment = .center
         nameLabel.backgroundColor = .lightGray
         nameLabel.textColor = .white
         nameLabel.font = UIFont.boldSystemFont(ofSize: 40)
         nameLabel.text = name
         UIGraphicsBeginImageContext(frame.size)
          if let currentContext = UIGraphicsGetCurrentContext() {
             nameLabel.layer.render(in: currentContext)
             let nameImage = UIGraphicsGetImageFromCurrentImageContext()
             return nameImage
          }
          return nil
    }

    
    @objc func action(sender: UIButton){
        let buttonTag = sender.tag
        let contacts = contact[buttonTag]
        if index1 == 3
        {
        alert(msg: "Are you sure want to delete emergency contact?", id: contacts.id! )
        }
        else if index1 == 6
        {
            alert(msg: "Are you sure want to delete doctor contact?", id: contacts.id! )
        }
    }
    
    @objc func action1(sender: UIButton){
        contacts = sender.tag
        performSegue(withIdentifier: "contactUpdate", sender: self)
//        let buttonTag = sender.tag
        
//        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//        let vc = storyboard.instantiateViewController(withIdentifier: "updateContacts") as! UpdateContactsViewController
//        vc.name = contacts.name
//        vc.phone = contacts.mobile
//        vc.email = contacts.email
//        vc.address1 = contacts.address1
//        vc.address2 = contacts.address2
//        vc.pincode = contacts.pincode
//        vc.uid  = contacts.uid
//        vc.type = contacts.type1
//        vc.index = index1
//        vc.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
//        vc.popoverPresentationController?.permittedArrowDirections = .any
//        vc.preferredContentSize.height = 400
//
//        vc.preferredContentSize.width = 300
//        vc.popoverPresentationController?.delegate = self
//        vc.popoverPresentationController?.sourceView = sender
//        //vc.popoverPresentationController?.sourceRect = sender.buttonGroup
//        self.present(vc, animated: true, completion: nil)



    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        print("index= \(index1)")
        if index1 == 3
        {
        Networking().allContacts(token: newToken!) { (data, error) in
            
            if let obj = data as? NSDictionary
            {
                let name = obj["name"] as? String ?? ""
                let phone = obj["mobile"] as? String ?? ""
                let email = obj["email"] as? String ?? ""
                let id = obj["id"] as? Int ?? 0
                let uid = obj["uid"] as? String ?? ""
                let type = obj["type"] as? Int ?? 0
                let cc = obj["cc"] as? String ?? ""
                let addr1 = obj["address1"] as? String ?? ""
                let addr2 = obj["address2"] as? String ?? ""
                let pincode = obj["pincode"] as? Int ?? 5
                if type == 1
                {
                let obj = contactDetails(myId: id, myUid: uid, myName: name, myType: 1, myEmail: email, myMobile: phone, mycc: cc, myAddress1: addr1, myAddress2: addr2, myPincode: pincode)
                self.contact.append(obj)

                    self.contactsTB.reloadData()
                }
                
                
            }
        }
        }
        if index1 == 5
        {
        Networking().allContacts(token: newToken!) { (data, error) in
            
            if let obj = data as? NSDictionary
            {
                let name = obj["name"] as? String ?? ""
                let phone = obj["mobile"] as? String ?? ""
                let email = obj["email"] as? String ?? ""
                let id = obj["id"] as? Int ?? 0
                let uid = obj["uid"] as? String ?? ""
                let type = obj["type"] as? Int ?? 0
                let cc = obj["cc"] as? String ?? ""
                let addr1 = obj["address1"] as? String ?? ""
                let addr2 = obj["address2"] as? String ?? ""
                let pincode = obj["pincode"] as? Int ?? 5
                if type == 2
                {

                let obj = contactDetails(myId: id, myUid: uid, myName: name, myType: 2, myEmail: email, myMobile: phone, mycc: cc, myAddress1: addr1, myAddress2: addr2, myPincode: pincode)
                self.contact.append(obj)
                
                self.contactsTB.reloadData()
                }
                
                
            }
        }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if index1 == 3
        {
        Networking().allContacts(token: newToken!) { (data, error) in
            
            if let obj = data as? NSDictionary
            {
                let name = obj["name"] as? String ?? ""
                let phone = obj["mobile"] as? String ?? ""
                let email = obj["email"] as? String ?? ""
                let id = obj["id"] as? Int ?? 0
                let uid = obj["uid"] as? String ?? ""
                let type = obj["type"] as? Int ?? 0
                let cc = obj["cc"] as? String ?? ""
                let addr1 = obj["address1"] as? String ?? ""
                let addr2 = obj["address2"] as? String ?? ""
                let pincode = obj["pincode"] as? Int ?? 5
                if type == 1
                {
                let obj = contactDetails(myId: id, myUid: uid, myName: name, myType: 1, myEmail: email, myMobile: phone, mycc: cc, myAddress1: addr1, myAddress2: addr2, myPincode: pincode)
                self.contact.append(obj)
                
                    self.contactsTB.reloadData()
                }
                
                
            }
        }
        }
        if index1 == 5
        {
        Networking().allContacts(token: newToken!) { (data, error) in
            
            if let obj = data as? NSDictionary
            {
                let name = obj["name"] as? String ?? ""
                let phone = obj["mobile"] as? String ?? ""
                let email = obj["email"] as? String ?? ""
                let id = obj["id"] as? Int ?? 0
                let uid = obj["uid"] as? String ?? ""
                let type = obj["type"] as? Int ?? 0
                let cc = obj["cc"] as? String ?? ""
                let addr1 = obj["address1"] as? String ?? ""
                let addr2 = obj["address2"] as? String ?? ""
                let pincode = obj["pincode"] as? Int ?? 5
                if type == 2
                {

                let obj = contactDetails(myId: id, myUid: uid, myName: name, myType: 2, myEmail: email, myMobile: phone, mycc: cc, myAddress1: addr1, myAddress2: addr2, myPincode: pincode)
                self.contact.append(obj)
                self.contactsTB.reloadData()
                }
                
                
            }
        }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if index1 == 3
        {
        Networking().allContacts(token: newToken!) { (data, error) in
            
            if let obj = data as? NSDictionary
            {
                let name = obj["name"] as? String ?? ""
                let phone = obj["mobile"] as? String ?? ""
                let email = obj["email"] as? String ?? ""
                let id = obj["id"] as? Int ?? 0
                let uid = obj["uid"] as? String ?? ""
                let type = obj["type"] as? Int ?? 0
                let cc = obj["cc"] as? String ?? ""
                let addr1 = obj["address1"] as? String ?? ""
                let addr2 = obj["address2"] as? String ?? ""
                let pincode = obj["pincode"] as? Int ?? 5
                if type == 1
                {
                let obj = contactDetails(myId: id, myUid: uid, myName: name, myType: 1, myEmail: email, myMobile: phone, mycc: cc, myAddress1: addr1, myAddress2: addr2, myPincode: pincode)
                self.contact.append(obj)
                
                    self.contactsTB.reloadData()
                }
                
                
            }
        }
        }
        if index1 == 5
        {
        Networking().allContacts(token: newToken!) { (data, error) in
            
            if let obj = data as? NSDictionary
            {
                let name = obj["name"] as? String ?? ""
                let phone = obj["mobile"] as? String ?? ""
                let email = obj["email"] as? String ?? ""
                let id = obj["id"] as? Int ?? 0
                let uid = obj["uid"] as? String ?? ""
                let type = obj["type"] as? Int ?? 0
                let cc = obj["cc"] as? String ?? ""
                let addr1 = obj["address1"] as? String ?? ""
                let addr2 = obj["address2"] as? String ?? ""
                let pincode = obj["pincode"] as? Int ?? 5
                if type == 2
                {

                let obj = contactDetails(myId: id, myUid: uid, myName: name, myType: 2, myEmail: email, myMobile: phone, mycc: cc, myAddress1: addr1, myAddress2: addr2, myPincode: pincode)
                self.contact.append(obj)
                self.contactsTB.reloadData()
                }
                
                
            }
        }
        }
    }
    
    func alert(msg:String, id: Int)
    {
        let alert = UIAlertController(title: "Alert!", message: msg, preferredStyle: .alert)
        let okay = UIAlertAction(title: "Yes", style: .default) { (alert) in
            Networking().deleteContacts(id: id, token: newToken!) { (data, error) in
                if self.contact.count > 0
                {
                    self.contactsTB.reloadData()
                }
//                if let obj = data as? NSDictionary
//                {
//                    print("deleted")
//                }
            }
        }
        
        let no = UIAlertAction(title: "No", style: .default, handler: nil)
            
        alert.addAction(okay)
        alert.addAction(no)
        present(alert, animated: true, completion: nil)
}

    @IBAction func addContacts(_ sender: UIButton) {
        performSegue(withIdentifier: "toEditContacts", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toEditContacts"
        {
            let dest = segue.destination as? EditContactsViewController
            dest?.index2 = index1
        }
        else if segue.identifier == "contactUpdate"
        {
            let vc = segue.destination as? UpdateContactsViewController
            vc?.name = contact[contacts].name
            vc?.phone = contact[contacts].mobile
            vc?.email = contact[contacts].email
            vc?.address1 = contact[contacts].address1
            vc?.address2 = contact[contacts].address2
            vc?.pincode = contact[contacts].pincode
            vc?.uid  = contact[contacts].uid
            vc?.type = contact[contacts].type1
            vc?.id = contact[contacts].id
            vc?.index = index1


        }
    }
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.none
    }

}


extension Array where Element: Hashable {
    func removingDuplicates() -> [Element] {
        var addedDict = [Element: Bool]()

        return filter {
            addedDict.updateValue(true, forKey: $0) == nil
        }
    }

    mutating func removeDuplicates() {
        self = self.removingDuplicates()
    }
}

extension Sequence where Iterator.Element: Hashable {
    func unique() -> [Iterator.Element] {
        var seen: Set<Iterator.Element> = []
        return filter { seen.insert($0).inserted }
    }
}


extension UIColor {
    convenience init(hexString: String, alpha: CGFloat = 1.0) {
        let hexString: String = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)

        if (hexString.hasPrefix("#")) {
            scanner.scanLocation = 1
        }

        var color: UInt32 = 0
        scanner.scanHexInt32(&color)

        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask

        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0

        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }

    func toHexString() -> String {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0

        getRed(&r, green: &g, blue: &b, alpha: &a)

        let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0

        return String(format:"#%06x", rgb)
    }
}
