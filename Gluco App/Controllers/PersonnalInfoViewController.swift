//
//  PersonnalInfoViewController.swift
//  Gluco App
//
//  Created by Anjali on 4/6/21.
//

import UIKit
import CoreData
class PersonnalInfoViewController: UIViewController, UIPopoverPresentationControllerDelegate {
    
    @IBOutlet var lname: UILabel!
    @IBOutlet var name: UILabel!
    
    @IBOutlet var phone: UILabel!
    @IBOutlet var dob: UILabel!
    @IBOutlet var email: UILabel!
    @IBOutlet var gender: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        if Reachability.isConnectedToNetwork() {
        Networking().profileData(token: newToken!) { (data, error) in
            if let obj = data as? NSDictionary{
                self.name.text = obj["fname"] as? String ?? ""
                self.lname.text = obj["lname"] as? String ?? ""
                self.gender.text = obj["gender"] as? String ?? ""
                self.email.text = obj["email"] as? String ?? ""
                self.dob.text = obj["dob"] as? String ?? ""
                self.phone.text = obj["mobile"] as? String ?? ""
            }
        }
        }
        else
        {
            
                let appdelegate = UIApplication.shared.delegate as? AppDelegate
                let context = appdelegate?.persistentContainer.viewContext
                do {
                    let fetchRequest = NSFetchRequest<NSFetchRequestResult>.init(entityName: "UserDetaills")
//                    fetchRequest.predicate = NSPredicate(format: "email == %@ AND password == %@", email.text as! CVarArg,password.text as! CVarArg)
                    let fetchedResults = try context?.fetch(fetchRequest) as! [UserDetaills]
//                    print("result \(fetchedResults)")
                    if let onerecord = fetchedResults.first
                    {
                        self.name.text = onerecord.fname
                        self.lname.text = onerecord.lname
                        self.gender.text = onerecord.gender
                        self.email.text = onerecord.email
                        self.dob.text = onerecord.dob
                        self.phone.text = onerecord.mobile

                    }
                    
                }catch{}
                
            
        }
    }
    

    @IBAction func healthSeg(_ sender: UISegmentedControl) {
        performSegue(withIdentifier: "healthInfo", sender: self)
    }
    
        
    @IBAction func edit(_ sender: UIButton) {
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "personalSB") as! EditPersonalViewController
        vc.firstname = name.text
        vc.lastname = lname.text
        vc.gender = gender.text
        vc.email = email.text
        vc.date = dob.text
        vc.phone = phone.text
//        vc.delegate = self
        vc.modalPresentationStyle = UIModalPresentationStyle.automatic
        vc.popoverPresentationController?.permittedArrowDirections = .any
//        vc.preferredContentSize.height = 300
//
//        vc.preferredContentSize.width = 400
        vc.popoverPresentationController?.delegate = self
        vc.popoverPresentationController?.sourceView = sender
        vc.popoverPresentationController?.sourceRect = CGRect(x: 200, y: 220, width: 400, height: 500)
        self.present(vc, animated: true, completion: nil)
    }
    

    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
    
}
