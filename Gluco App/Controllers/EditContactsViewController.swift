//
//  EditContactsViewController.swift
//  Gluco App
//
//  Created by Anjali on 4/6/21.
//

import UIKit
import ADCountryPicker

class EditContactsViewController: UIViewController {

    var index2 = 0
    @IBOutlet var pincode: UITextField!
    @IBOutlet var address2: UITextField!
    @IBOutlet var address1: UITextField!
    @IBOutlet var phone: UITextField!
    @IBOutlet var email: UITextField!
    @IBOutlet var name: UITextField!
    @IBOutlet var code: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func countrydrop(_ sender: UIButton) {
        let picker = ADCountryPicker(style: .grouped)
        // delegate
        picker.delegate = self

        // Display calling codes
//        picker.showCallingCodes = true

            
        // or closure
        picker.didSelectCountryClosure = { name, code in
            _ = picker.navigationController?.popToRootViewController(animated: true)
            print(code)
            let pickerNavigationController = UINavigationController(rootViewController: picker)
            self.present(pickerNavigationController, animated: true, completion: nil)

    }
    }
    

//    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
//
//        if textField == self.country
//        {
//        let picker = ADCountryPicker(style: .insetGrouped)
//        // delegate
//        picker.delegate = self
//
//        // Display calling codes
////        picker.showCallingCodes = true
//
//
//        // or closure
//        picker.didSelectCountryClosure = { name, code in
//            _ = picker.navigationController?.popToRootViewController(animated: true)
//            print(code)
//        }
//
//
////        Use this below code to present the picker
//
//        let pickerNavigationController = UINavigationController(rootViewController: picker)
//        self.present(pickerNavigationController, animated: true, completion: nil)
//            return false
//        }
//
//        return true
//    }
   
    @IBAction func submit(_ sender: UIButton) {
        if validZipCode(postalCode: pincode.text!) != true
        {
            alert(msg: "Invalid Pincode")
        }
        else if email.text?.isValidEmail != true
        {
            alert(msg: "Invalide Email")
        }
        else if phone.text?.isValidPhone != true
        {
            alert(msg: "Invalid PhoneNumber")
        }
        else{
                Networking().deviceType { (data, error) in
            if let obj = data as? NSDictionary
            {
                let id = obj["id"] as? Int ?? 0
                print("id = \(id)")
                let pin = Int(self.pincode.text!)
                if id == 1 && self.index2 == 3
                {
                Networking().addContacts(name: self.name.text!, type: 1, cc: self.code.currentTitle!, mobile: self.phone.text!, email: self.email.text!, address: self.address1.text!, address2: self.address2.text!, pincode: pin!, token: newToken!) { (data, error) in
                    if ((data as? NSDictionary) != nil)
                    {
                        print("inserted")
                    }
                }
                }
                else if id == 2 && self.index2 == 5
                {
                    Networking().addContacts(name: self.name.text!, type: 2, cc: self.code.currentTitle!, mobile: self.phone.text!, email: self.email.text!, address: self.address1.text!, address2: self.address2.text!, pincode: pin!, token: newToken!) { (data, error) in
                        if ((data as? NSDictionary) != nil)
                        {
                            print("inserted")
                        }
                    }
                }
            }
        }
    }
        
    }
    
    func validZipCode(postalCode:String)->Bool{
            let postalcodeRegex = "^[0-9]{6}$"
            let pinPredicate = NSPredicate(format: "SELF MATCHES %@", postalcodeRegex)
            let bool = pinPredicate.evaluate(with: postalCode) as Bool
            return bool
        }

}
extension EditContactsViewController: ADCountryPickerDelegate {
    
    func countryPicker(_ picker: ADCountryPicker, didSelectCountryWithName name: String, code: String, dialCode: String) {
        _ = picker.navigationController?.popToRootViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
//        countryNameLabel.text = name
//        countryCodeLabel.text = code
//        countryCallingCodeLabel.text = dialCode
//        country.text = "\(name) \(code)"
//        countryName = name
//        picker.defaultCountryCode = "IN"
       let x =  picker.getFlag(countryCode: code)
        let xx =  picker.getCountryName(countryCode: code)
        let xxx =  picker.getDialCode(countryCode: code)
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
