//
//  SignUp4ViewController.swift
//  Gluco App
//
//  Created by Anjali on 4/6/21.
//

import UIKit
import WebKit

class SignUp4ViewController: UIViewController {
    
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
    var feet:String?
    var inches:String?
    

    @IBOutlet var checkBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func agreementChecking(_ sender: UIButton) {
        if checkBtn.isSelected {
            checkBtn.setBackgroundImage(#imageLiteral(resourceName: "uncheck"), for:.normal)
        } else {
            checkBtn.setBackgroundImage(#imageLiteral(resourceName: "check"), for: .normal)
        }
        checkBtn.isSelected = !checkBtn.isSelected

    }
    
    
    @IBAction func agreementDoc(_ sender: UIButton) {
//        let url = Bundle.main.url(forResource: "sample", withExtension: "pdf")
//
//            if let url = url {
//                let webView = WKWebView(frame: view.frame)
//                let urlRequest = URLRequest(url: url)
//                webView.load(urlRequest)
//                view.addSubview(webView)
//            }
        
        performSegue(withIdentifier: "PDFView", sender: self)
    }
    
    
    @IBAction func nextVC(_ sender: UIButton) {
        if (checkBtn.backgroundImage(for: .normal) == UIImage(named: "check"))
        {
        performSegue(withIdentifier: "SignUp5", sender: self)
        }
        else
        {
            let alert = UIAlertController(title: "Alert!", message: "Please accept terms and conditions", preferredStyle: .alert)

            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))

            self.present(alert, animated: true)

        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SignUp5"
        {
            let vc = segue.destination as! OTPVerificationViewController
            vc.fname = fname
            vc.lname = lname
            vc.gender = gender
            vc.blood = blood
            vc.country = country
            vc.height = height
            vc.weight = weight
            vc.date = date
            vc.email = email
            vc.password = password
            vc.mobileNumber = mobileNumber
            vc.feet = feet
            vc.inches = inches
        }
    }

}
