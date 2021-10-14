//
//  ProfileViewController.swift
//  Gluco App
//
//  Created by Anjali on 4/6/21.
//

import UIKit
import CoreData

class ProfileViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet var profileTB: UITableView!
    var name = ["name"]
    var profileObj:[userDetails] = []
    var profileimage:[profilepic] = []
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profileObj.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell1 = UITableViewCell()
        if Reachability.isConnectedToNetwork(){
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell", for: indexPath) as! ProfileTableViewCell
        cell.name.text = profileObj[indexPath.row].fname
        cell.userid.text = profileObj[indexPath.row].userid
            cell1 = cell
        }
        else
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell", for: indexPath) as! ProfileTableViewCell
            cell.name.text = profileObj[indexPath.row].fname
//            cell.userid.text = profileObj[indexPath.row].userid
                cell1 = cell
        }
        return cell1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        switch indexPath.row {
//        case 0:
            performSegue(withIdentifier: "toPersonal", sender: self)
//        default:
//            break
//        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        if Reachability.isConnectedToNetwork(){
        Networking().profileData(token: newToken!) { (data, error) in
            if let obj = data as? NSDictionary{
                let name = obj["fname"] as? String ?? ""
                let lname = obj["lname"] as? String ?? ""
                let gender = obj["gender"] as? String ?? ""
                let email = obj["email"] as? String ?? ""
                let dob = obj["dob"] as? String ?? ""
                let phone = obj["mobile"] as? String ?? ""
                let bgroup = obj["b_group"] as? String ?? ""
                let country_code = obj["country_code"] as? String ?? ""
//                let height = obj["height"] as
//                let mobile = obj["mobile"] as? String ?? ""
                let refreshToken = obj["refreshToken"] as? String ?? ""
                let region = obj["region"] as? String ?? ""
                let token = obj["token"] as? String ?? ""
                let uid = obj["uid"] as? String ?? ""
                let userId = obj["userId"] as? String ?? ""
                let weight = obj["weight"] as? String ?? ""
                let obj1 = userDetails(myEmail: email, myGender: gender, myMobile: phone, myWeight: weight, myLname: lname, myB_group: bgroup, myFname: name, mydob: dob, myRegion: region, uid: uid, token: token, refreshToken: refreshToken, userId: userId)
                self.profileObj.append(obj1)
                self.profileTB.reloadData()
            }
        }
            
            Networking().getProfilePic(token: newToken!) { (data, error) in
                if let mydata = data as? NSDictionary
                {
                    let image = mydata["profile_pic"] as? String ?? ""
                    let convertedImage = self.convertBase64ToImage(imageString: image)
                    print("imagr \(convertedImage)")
//                    self.profileImg.image = convertedImage
                  let obj = profilepic(myPic: image)
                    self.profileimage.append(obj)
                    self.profileTB.reloadData()
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
                        let obj = userDetails(myEmail: onerecord.email!, myGender: onerecord.gender!, myMobile: onerecord.mobile!, myWeight: onerecord.weight!, myLname: onerecord.lname!, myB_group: onerecord.b_group!, myFname: onerecord.fname!, mydob: onerecord.dob!, myRegion: onerecord.region!)
                        self.profileObj.append(obj)
                        self.profileTB.reloadData()
                    }
                    
                }catch{}
                
            
        }
    }
    

    func convertBase64ToImage(imageString: String) -> UIImage {
            let imageData = Data(base64Encoded: imageString, options: Data.Base64DecodingOptions.ignoreUnknownCharacters)!
            return UIImage(data: imageData)!
        }
    
//    func getAllData(profileData:[userDetails],profileImg:[profilepic])
//    {
//        if profileData.count > 0
//        {
//            for i in profileData
//        }
//    }

}
