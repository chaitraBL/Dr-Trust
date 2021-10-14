//
//  OTPVerificationViewController.swift
//  Gluco App
//
//  Created by Anjali on 4/6/21.
//

import UIKit
import CoreData

class OTPVerificationViewController: UIViewController {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    var fname:String?
    var lname:String?
    var gender:String?
    var date:String?
    var height:String?
    var weight:String?
    var blood:String?
    var country:String?
    var email:String?
    var password:String?
    var mobileNumber:String?
//    var dob:String?
//    var gender:String?
    var token:String?
    var otpNumber:String?
    var otpText:[String] = []
    var feet:String?
    var inches:String?
    var heightArray:[String] = []
    var login:[userMessage] = []
    override func viewDidLoad() {
        super.viewDidLoad()

//        print("number = \(mobileNumber)")
//        print("feet = \(feet)")
//        print("inches = \(inches)")
//        otpText.delegate = self
//        let selectWeight = weight?.split(separator: " ")
//        print("weight \(selectWeight)")
        Networking().getOTPNumber(number: mobileNumber!) { (data, error) in
            if ((data as? NSDictionary) != nil)
           {
//                print("session token = \(data["session_token"] as? String ?? "")")
                
                self.token = data["session_token"] as? String ?? ""
                
                }
           }
        

        
    }
    
    @IBAction func verifyAndFinish(_ sender: UIButton) {
        
//        height?.forEach({ (char) in
//
//            heightArray.append(char.description)
//
//            for i in heightArray
//            {
////                [3,',1,1]
//                feet = i
//                inches = i
//            }
//
//            print("array \(feet) & \(inches)")
//        })
        
        
        
        if otpdata.count > 0
        {
            for i in otpdata
            {
                otpText.append(i.otp!)
                otpNumber = otpText.joined()
//                print("numb = \(otpNumber ?? "")")
                
                Networking().otpVerify(number: mobileNumber!, otpNumber: otpNumber!, token: token!) { (data, error) in
                    if let obj = data as? NSDictionary
                    {
//                        let message = obj["message"] as? String ?? ""
//                        let item = UserDetaills(context: self.context)
//                        item.email = self.email
//                        item.mobile = self.mobileNumber
//                        item.fname = self.fname
//                        item.lname = self.lname
//                        item.b_group = self.blood
//                        item.gender = self.gender
//                        item.dob = self.date
//                        item.region = self.country
//                        item.weight = self.weight
////                        item.uid =
//                        item.password = self.password
//
////                        self.token = obj["token"] as? String ?? ""
////                        item.token = self.token
////                        self.refreshtoken = obj["refreshToken"] as? String ?? ""
//                        item.height = self.height
//        //                print("token \(refreshtoken)")
////                        item.refreshToken = self.refreshtoken
//
//                        (UIApplication.shared.delegate as! AppDelegate).saveContext()
                        let data = obj["data"] as? String ?? ""
                                    let alert = UIAlertController(title: "Alert!", message: data, preferredStyle: .alert)

                        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (alert) in
                            Networking().userRegister(email: self.email!, password: self.password!, mobile: self.mobileNumber!, feet: self.feet!, inches: self.inches!, weight: self.weight!, fname: self.fname!, lname: self.lname!, b_group: self.blood!, gender: self.gender!, dob: self.date!, region: self.country!, is_parent: "true") { (data, error) in
                                if let obj1 = data as? NSDictionary
                                {
                                    let data = obj1["data"] as? String ?? ""
                                    let alert = UIAlertController(title: "Alert!", message: data, preferredStyle: .alert)

                        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (alert) in
                            Networking().userLogin(username: self.email!, password: self.password!) { (data, error) in
                                if let obj2 = data as? NSDictionary
                                {
//                                    let message = obj["message"] as? String ?? ""
                                                            let item = UserDetaills(context: self.context)
                                                            item.email = self.email
                                                            item.mobile = self.mobileNumber
                                                            item.fname = self.fname
                                                            item.lname = self.lname
                                                            item.b_group = self.blood
                                                            item.gender = self.gender
                                                            item.dob = self.date
                                                            item.region = self.country
                                                            item.weight = self.weight
                                    //                        item.uid =
                                                            item.password = self.password
                                    
                                    //                        self.token = obj["token"] as? String ?? ""
                                    //                        item.token = self.token
                                                            item.refreshToken = obj2["refreshToken"] as? String ?? ""
                                                            item.height = self.height
                                            //                print("token \(refreshtoken)")
//                                                            item.refreshToken = obj2[""] as? String ?? ""
                                    
                                                            (UIApplication.shared.delegate as! AppDelegate).saveContext()
                                }
                            }
                        }))

                                    self.present(alert, animated: true)
                                }
                            }
                        }))

                                    self.present(alert, animated: true)

                                }
                            }
//                        }
//
//                    }
//                }
            }
        }
//
        
    }
    
}

//import UIKit
//
//class ViewController: UIViewController {
//
//    @IBOutlet weak var timerLabel: UILabel!
//
//    var countdownTimer: Timer!
//    var totalTime = 60
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.
//    }
//
//    func startTimer() {
//        countdownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
//    }
//
//    func updateTime() {
//        timerLabel.text = "\(timeFormatted(totalTime))"
//
//        if totalTime != 0 {
//            totalTime -= 1
//        } else {
//            endTimer()
//        }
//    }
//
//    func endTimer() {
//        countdownTimer.invalidate()
//    }
//
//    func timeFormatted(_ totalSeconds: Int) -> String {
//        let seconds: Int = totalSeconds % 60
//        let minutes: Int = (totalSeconds / 60) % 60
//        //     let hours: Int = totalSeconds / 3600
//        return String(format: "%02d:%02d", minutes, seconds)
//    }
//
//
//    @IBAction func startTimerPressed(_ sender: UIButton) {
//        startTimer()
//    }
//
//}
