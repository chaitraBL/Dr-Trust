//
//  EditPersonalViewController.swift
//  Gluco App
//
//  Created by Anjali on 29/6/21.
//

import UIKit
import ADCountryPicker

class EditPersonalViewController: UIViewController, UIPopoverPresentationControllerDelegate,dateSelected {
    func selectedDate(selected: String) {
        dob.text = selected
    }
    

    var email:String?
    var date1:Int?
    var firstname:String?
    var lastname:String?
    var gender:String?
    var phone:String?
    var date:String?
    
    @IBOutlet var fname: UITextField!
    @IBOutlet var country: UITextField!
    var profileArray:[String:Any] = [:]
    @IBOutlet var mobile: UITextField!
    @IBOutlet var dob: UITextField!
    @IBOutlet var emailId: UITextField!
    @IBOutlet var lname: UITextField!
    var selected:String?
    @IBOutlet var femaleLabel: UILabel!
    @IBOutlet var maleLabel: UILabel!
    @IBOutlet var femaleGender: UIButton!
    @IBOutlet var maleGender: UIButton!
    let radioController = RadioButtonController()
    override func viewDidLoad() {
        super.viewDidLoad()

        fname.text = firstname
        lname.text = lastname
        emailId.text = email
        dob.text = date
        if gender == femaleLabel.text
        {
            femaleGender.setImage(UIImage(named: "CheckedRadio"), for: .normal)
        }
        if gender == maleLabel.text {
            maleGender.setImage(UIImage(named: "CheckedRadio"), for: .normal)

        }
        mobile.text = phone
        radioController.buttonsArray = [maleGender,femaleGender]
    }
    
   
    
    @IBAction func maleButton(_ sender: UIButton) {
        radioController.buttonArrayUpdated(buttonSelected: sender)
        selected = maleLabel.text

    }
    
    @IBAction func femaleButton(_ sender: UIButton) {
        radioController.buttonArrayUpdated(buttonSelected: sender)
        selected = femaleLabel.text
    }
    
    @IBAction func datePick(_ sender: UIButton) {
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "DatePick") as! DatePickerViewController
        
//        vc.delegate = self
        vc.modalPresentationStyle = UIModalPresentationStyle.popover
        vc.popoverPresentationController?.permittedArrowDirections = .any
//        vc.preferredContentSize.height = 300
//
//        vc.preferredContentSize.width = 400
        vc.popoverPresentationController?.delegate = self
        vc.popoverPresentationController?.sourceView = sender
        vc.popoverPresentationController?.sourceRect = sender.bounds
//            CGRect(x: 200, y: 220, width: 200, height: 200)
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func cancel(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func save(_ sender: UIButton) {
//        print(date1)
//        dob.text = String(date1!)
        profileArray = ["mobile":mobile.text!,"dob":dob.text!,"fname":fname.text!,"lname":lname.text!,"gender":selected as Any,"email":emailId.text!,"country_code":country.text!] as [String:Any]
        let headerpass = ["Authorization" : newToken!]
        let array1 = ["b_group":"B-ve"]
        Networking().updateProfile(parameter: array1, token: headerpass) { (data, error) in
            if ((data as? NSDictionary) != nil)
           {
            print("updated")
           }
        }
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        if textField == self.country
        {
        let picker = ADCountryPicker(style: .insetGrouped)
        // delegate
        picker.delegate = self

        // Display calling codes
//        picker.showCallingCodes = true

            
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
    
}

extension String {
   var isValidEmail: Bool {
      let regularExpressionForEmail = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
      let testEmail = NSPredicate(format:"SELF MATCHES %@", regularExpressionForEmail)
      return testEmail.evaluate(with: self)
   }
   var isValidPhone: Bool {
      let regularExpressionForPhone = "^\\d{3}-\\d{3}-\\d{4}$"
      let testPhone = NSPredicate(format:"SELF MATCHES %@", regularExpressionForPhone)
      return testPhone.evaluate(with: self)
   }
}

extension EditPersonalViewController: ADCountryPickerDelegate {
    
    func countryPicker(_ picker: ADCountryPicker, didSelectCountryWithName name: String, code: String, dialCode: String) {
        _ = picker.navigationController?.popToRootViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
//        countryNameLabel.text = name
//        countryCodeLabel.text = code
//        countryCallingCodeLabel.text = dialCode
        country.text = code
//        countryName = name
//        picker.defaultCountryCode = "IN"
       let x =  picker.getFlag(countryCode: code)
        let xx =  picker.getCountryName(countryCode: code)
        let xxx =  picker.getDialCode(countryCode: code)
    }
}
