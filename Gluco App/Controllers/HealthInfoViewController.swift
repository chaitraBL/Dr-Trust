//
//  HealthInfoViewController.swift
//  Gluco App
//
//  Created by Anjali on 4/6/21.
//

import UIKit
import CoreData

class HealthInfoViewController: UIViewController, UIPopoverPresentationControllerDelegate {

    @IBOutlet var height: UILabel!
    
    @IBOutlet var blood: UILabel!
    @IBOutlet var weight: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        if Reachability.isConnectedToNetwork(){
        Networking().profileData(token: newToken!) { (data, error) in
            if let obj = data as? NSDictionary{
                self.weight.text = obj["weight"] as? String ?? ""
                self.blood.text = obj["b_group"] as? String ?? ""
                self.height.text = obj["height"] as? String ?? ""
//                if let obj1 = obj["height"] as? NSDictionary
//                {
//                    let feet = obj1["feet"] as? Int ?? 0
//                    let inches = obj1["inches"] as? Int ?? 0
//                    self.height.text = String(obj1["feet"] as! Int) + "'" + String(obj1["inches"] as! Int)
////                        String(feet) + "'" + String(inches)
//                }
                
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
                        self.weight.text = onerecord.weight
                        self.blood.text = onerecord.b_group
                        self.height.text = onerecord.height

                    }
                    
                }catch{}
                
            
        }
    }
    
    
    @IBAction func personalSeg(_ sender: UISegmentedControl) {
        performSegue(withIdentifier: "personalSeg", sender: self)
    }
    

    @IBAction func edit(_ sender: UIButton) {
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "healthSB") as! EditHealthViewController
        vc.height = height.text
        vc.weight = weight.text
        vc.blood = blood.text
//        vc.delegate = self
        vc.modalPresentationStyle = UIModalPresentationStyle.popover
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
