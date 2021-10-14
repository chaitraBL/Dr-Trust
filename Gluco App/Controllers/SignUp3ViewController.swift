//
//  SignUp3ViewController.swift
//  Gluco App
//
//  Created by Anjali on 4/6/21.
//

import UIKit
import Alamofire
import ADCountryPicker

class SignUp3ViewController: UIViewController, UITextFieldDelegate {

    var fname:String?
    var lname:String?
    var gender:String?
    var date:String?
    var height:String?
    var weight:String?
    var blood:String?
    var country:String?
    var feet:String?
    var inches:String?
    
    @IBOutlet var email: UITextField!
    @IBOutlet var countryCode: UITextField!
    
    @IBOutlet var showHide1: UIButton!
    @IBOutlet var password: UITextField!
    @IBOutlet var showHide2: UIButton!
    var phoneNumber:String?
    @IBOutlet var mobileNumber: UITextField!
    @IBOutlet var confirmPassword: UITextField!
    var passwordVisible: Bool = true
    override func viewDidLoad() {
        super.viewDidLoad()

        countryCode.delegate = self
    }
    
    @IBAction func showHidePass1(_ sender: UIButton) {
        if passwordVisible {
                    password.isSecureTextEntry = false
            showHide1.setImage(UIImage(named: "ShowPassword"), for: .normal)
                    passwordVisible = false
                } else {
                    password.isSecureTextEntry = true
                    showHide1.setImage(UIImage(named: "HidePassword"), for: .normal)
                    passwordVisible = true
                }
    }
    
    @IBAction func showHidePass2(_ sender: UIButton) {
        if passwordVisible {
                    confirmPassword.isSecureTextEntry = false
            showHide2.setImage(UIImage(named: "ShowPassword"), for: .normal)
                    passwordVisible = false
                } else {
                    confirmPassword.isSecureTextEntry = true
                    showHide2.setImage(UIImage(named: "HidePassword"), for: .normal)
                    passwordVisible = true
                }
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        if textField == self.countryCode
        {
        let picker = ADCountryPicker(style: .insetGrouped)
        // delegate
        picker.delegate = self

        // Display calling codes
        picker.showCallingCodes = true

            
        // or closure
        picker.didSelectCountryClosure = { name, code in
            _ = picker.navigationController?.popToRootViewController(animated: true)
            print(code)
        }
        
        
//        Use this below code to present the picker
        
        let pickerNavigationController = UINavigationController(rootViewController: picker)
        self.present(pickerNavigationController, animated: true, completion: nil)
            return false
        }
       
        return true
    }
    
    @IBAction func nextVC(_ sender: UIButton) {
        phoneNumber = countryCode.text!+mobileNumber.text!
        Networking().phineNumberVerification(email: email.text!, phoneNumber: phoneNumber!) { (data, error) in
            if let messagedata = data as? NSDictionary
            {
                print("message \(messagedata["message"] as? String ?? "")")
                let message = messagedata["message"] as? String
                if message == "Valid"
                {
                    let newpassword = self.validpassword(mypassword: self.password.text!, confirmpassword: self.confirmPassword.text!)
                    if newpassword == true
                    {
                        
                        self.alert(message: "Password should contain 6 characters.")
                    }
                    else if self.password.text != self.confirmPassword.text
                    {
                        self.alert(message: "Password doesn't match")
                    }
                    else
                    {
                        self.performSegue(withIdentifier: "SignUp4", sender: self)
                    }
                }
                else {
                    self.alert(message: message!)

                }
            }


        }
        
    }
    
    func alert(message:String) {
        let alert = UIAlertController(title: "Alert!", message: message, preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))

        self.present(alert, animated: true)

    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SignUp4"
        {
            let vc = segue.destination as! SignUp4ViewController
            vc.fname = fname
            vc.lname = lname
            vc.gender = gender
            vc.blood = blood
            vc.country = country
            vc.height = height
            vc.weight = weight
            vc.date = date
            vc.email = email.text
            vc.password = password.text
            vc.mobileNumber = phoneNumber
            vc.feet = feet
            vc.inches = inches
        }
    }


}
extension SignUp3ViewController: ADCountryPickerDelegate {
    
    func countryPicker(_ picker: ADCountryPicker, didSelectCountryWithName name: String, code: String, dialCode: String) {
        _ = picker.navigationController?.popToRootViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
//        countryNameLabel.text = name
//        countryCodeLabel.text = code
//        countryCallingCodeLabel.text = dialCode
        countryCode.text = dialCode
//        picker.defaultCountryCode = "IN"
       let x =  picker.getFlag(countryCode: code)
        let xx =  picker.getCountryName(countryCode: code)
        let xxx =  picker.getDialCode(countryCode: code)
    }
    func validpassword(mypassword : String, confirmpassword:String) -> Bool
        {

            let passwordreg =  ("(?=.*[A-Z])(?=.*[0-9])(?=.*[a-z])(?=.*[@#$%^&*]).{8,}")
            let passwordtesting = NSPredicate(format: "SELF MATCHES %@", passwordreg)
        var password = passwordtesting.evaluate(with: mypassword)
        password = passwordtesting.evaluate(with: confirmpassword)

            return password
        }

}
