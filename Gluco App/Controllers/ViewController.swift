//
//  ViewController.swift
//  Gluco App
//
//  Created by Anjali on 31/5/21.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var readingList:[readingData] = []
//    var heightDetails:[Model] = []
    var details:[userDetails] = []
    @IBOutlet var email: UITextField!
    @IBOutlet var password: UITextField!
    var passwordVisible: Bool = true
    var token:String?
    var refreshtoken:String?
    var name:String?
    var userid:String?
    var email1:String?
    var uid:String?
    @IBOutlet var showHideBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        navigationController?.isNavigationBarHidden = true
        

    }
    
    
    @IBAction func showHidePass(_ sender: UIButton) {
        if passwordVisible {
                    password.isSecureTextEntry = false
            showHideBtn.setImage(UIImage(named: "ShowPassword"), for: .normal)
                    passwordVisible = false
                } else {
                    password.isSecureTextEntry = true
                    showHideBtn.setImage(UIImage(named: "HidePassword"), for: .normal)
                    passwordVisible = true
                }
    }
    

    @IBAction func login(_ sender: UIButton) {
        if Reachability.isConnectedToNetwork()
        {
            Networking().userLogin(username: email.text!, password: password.text!) { (data, error) in
    //            self.heightDetails = data as! [Model]
                if let obj = data as? NSDictionary{
    //
                    self.uid = obj["uid"] as? String ?? ""
                    self.refreshtoken = obj["refreshToken"] as? String ?? ""
                    let fname = obj["fname"] as? String ?? ""
    //            print("retoken \(self.refreshtoken)")
                Networking().refreshToken(refreshToken: self.refreshtoken!) { (data, error) in
    //                print("dataa \(data)")
                    if let obj = data as? NSDictionary
                    {
                        newToken = obj["data"] as? String ?? ""
                        print("new token \(newToken)")
                        let readingDetails = self.checkIfItemExist(id: self.uid!, token: newToken!)
                        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                                let mainTabBarController = storyboard.instantiateViewController(identifier: "MainTab") as? MainTabBarController
                        mainTabBarController?.modalPresentationStyle = .fullScreen
                        mainTabBarController?.refershToken = newToken
                        mainTabBarController?.name = fname
            //            mainTabBarController
                        self.present(mainTabBarController!, animated: true, completion: nil)
                }
//                Networking().readingType { (data, error) in
//                    if let obj = data as? NSDictionary {
//                        let readingType = ReadingType(context: self.context)
//                        readingType.diabetic = Int16(obj["diabetic"] as? Int ?? 0)
//                        readingType.ed_max = Int16(obj["ed_max"] as? Int ?? 0)
//                        readingType.ed_min = Int16(obj["ed_min"] as? Int ?? 0)
//                        readingType.id = Int16(obj["id"] as? Int ?? 0)
//                        readingType.name = obj["name"] as? String ?? ""
//                        readingType.normal_max = Int16(obj["normal_max"] as? Int ?? 0)
//                        readingType.normal_min = Int16(obj["normal_min"] as? Int ?? 0)
//                        (UIApplication.shared.delegate as! AppDelegate).saveContext()
//                    }
                    

                }
                    
                }
    //            self.performSegue(withIdentifier: "toHome", sender: self)
    //            let storyboard = UIStoryboard(name: "Main", bundle: nil)
    //                let mainTabBarController = storyboard.instantiateViewController(identifier: "MainTab")
    //
    //                // This is to get the SceneDelegate object from your view controller
    //                // then call the change root view controller function to change to main tab bar
    //                (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
                
                

    //
    //
    //        }
            }
        }
        
        else
        {
            let appdelegate = UIApplication.shared.delegate as? AppDelegate
            let context = appdelegate?.persistentContainer.viewContext
            do {
                let fetchRequest = NSFetchRequest<NSFetchRequestResult>.init(entityName: "UserDetaills")
                fetchRequest.predicate = NSPredicate(format: "email == %@ AND password == %@", email.text as! CVarArg,password.text as! CVarArg)
                let fetchedResults = try context?.fetch(fetchRequest) as! [UserDetaills]
                print("result \(fetchedResults)")
                if let onerecord = fetchedResults.first
                {
//                    print("email \(onerecord.email)")
//                    print("password \(onerecord.password)")
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                            let mainTabBarController = storyboard.instantiateViewController(identifier: "MainTab") as? MainTabBarController
                    mainTabBarController?.modalPresentationStyle = .fullScreen
//                    mainTabBarController?.refershTok
                    mainTabBarController?.name = onerecord.fname
                    self.present(mainTabBarController!, animated: true, completion: nil)

                }
                else{
                    let alert = UIAlertController(title: "Alert!", message: "Incorrect username/password", preferredStyle: .alert)
                    let ok = UIAlertAction(title: "ok", style: .default, handler: nil)
                    alert.addAction(ok)
                    self.present(alert, animated: true, completion: nil)
                }
            }catch{}
            
        }
    }
    
    func checkIfItemExist(id: String, token:String) -> Bool {

//        let managedContext = CoreDataStack.sharedInstance.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "ReadingList")
        fetchRequest.fetchLimit =  1
        fetchRequest.predicate = NSPredicate(format: "uid == %d" ,id)
//        fetchRequest.predicate = NSPredicate(format: "type == %@" ,type)

        do {
            let count = try context.count(for: fetchRequest)
            if count > 0 {
                
                return true
            }else {
                Networking().readingList(token: token) { (data, error) in
//                                print("data \(data)")
                    
                    self.readingList = (data as? [readingData])!
                    if self.readingList.count > 0
                    {
                        
                        for i in self.readingList
                        {
//                                    let readingDetails = checkIfItemExist(id: uid!)
                            let readingItem = ReadingList(context: self.context)
                            readingItem.created_at = i.date
                            readingItem.reading_time = i.time
                            readingItem.status = i.status
                            readingItem.value = Int16(i.value!)
                            readingItem.reading_type = Int16(i.readingType!)
//                            readingItem.uid = i.uid
                            (UIApplication.shared.delegate as! AppDelegate).saveContext()
//                            print("inserted")
                        }
                        
                    }
            }
                return false
            }
        }catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
            return false
        }
    }

    @IBAction func signup(_ sender: UIButton) {
        performSegue(withIdentifier: "toSign", sender: self)
    }
    
    @IBAction func forgotPass(_ sender: UIButton) {
        let alert = UIAlertController(title: "Reset Password", message: "", preferredStyle: .alert)

        //2. Add the text field. You can configure it however you need.
        alert.addTextField { (textField) in
            textField.placeholder = "Email Id"
        }

        alert.addAction(UIAlertAction(title: "CANCEL", style: .default, handler: nil))
        // 3. Grab the value from the text field, and print it when the user clicks OK.
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            let textField = alert?.textFields![0] // Force unwrapping because we know it exists.
            Networking().resetPassword(email: (textField?.text)!) { (data, error) in
                if let obj = data as? NSDictionary
                {
                    let message = obj["message"] as? String ?? ""
//                    print("message \(message)")
                    if message == "Success"
                    {
                        let alert = UIAlertController(title: "Alert!", message: "Password reset link sent to register email address", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                    }
                    else
                    {
                        let alert = UIAlertController(title: "Alert!", message: "Check your email and try again ", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                    }
                }
            }
            
        }))
       

        // 4. Present the alert.
        self.present(alert, animated: true, completion: nil)

    }
    
    
    
    
}



