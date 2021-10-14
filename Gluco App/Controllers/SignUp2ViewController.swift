//
//  SignUp2ViewController.swift
//  Gluco App
//
//  Created by Anjali on 4/6/21.
//

import UIKit
import DatePickerDialog
import iOSDropDown
import ADCountryPicker


class SignUp2ViewController: UIViewController, UITextFieldDelegate {
    
    var heightData:[String] = []
    var fname:String?
    var lname:String?
    var gender:String?
    var selectedHeight:String?
    var selectedWeight:String?
    var selectedBlood:String?
    var feet:String?
    var inches:String?
    var countryName:String?
   
    @IBOutlet var country: UITextField!
    @IBOutlet var heightDrop: DropDown!
    @IBOutlet var weightDrop: DropDown!
    @IBOutlet var dateText: UITextField!
//    var datePicker = DatePickerDialog()
  var datePicker = UIDatePicker()
    @IBOutlet var bloodDrop: DropDown!
    override func viewDidLoad() {
        super.viewDidLoad()

//        print(fname)
//        print(lname)
//        print(gender)
        
        heightDrop.optionArray = ["3'0","3'1","3'2","3'3","3'4","3'5","3'6","3'7","3'8","3'9","3'10","3'11","4'0","4'1","4'2","4'3","4'4","4'5","4'6","4'7","4'8","4'9","4'10","4'11","5'0","5'1","5'2","5'3","5'4","5'5","5'6","5'7","5'8","5'9","5'10","5'11","6'0","6'1","6'2","6'3","6'4","6'5","6'6","6'7","6'8","6'9","6'10","6'11","7'0","7'1","7'2","7'3","7'4","7'5","7'6","7'7","7'8","7'9","7'10","7'11"]
        weightDrop.optionArray = ["01kgs","02kgs","03kgs","04kgs","05kgs","06kgs","07kgs","08kgs","09kgs","10kgs","11kgs","12kgs","13kgs","14kgs","15kgs","16kgs","17kgs","18kgs","19kgs","20kgs","21kgs","22kgs","23kgs","24kgs","25kgs","26kgs","27kgs","28kgs","29kgs","30kgs","31kgs","32kgs","33kgs","34kgs","35kgs","36kgs","37kgs","38kgs","39kgs","40kgs","41kgs","42kgs","43kgs","44kgs","45kgs","46kgs","47kgs","48kgs","49kgs","50kgs","51kgs","52kgs","53kgs","54kgs","55kgs","56kgs","57kgs","58kgs","59kgs","60kgs","61kgs","62kgs","63kgs","64kgs","65kgs","66kgs","67kgs","68kgs","69kgs","70kgs","71kgs","72kgs","73kgs","74kgs","75kgs","76kgs","77kgs","78kgs","79kgs","80kgs","81kgs","82kgs","83kgs","84kgs","85kgs","86kgs","87kgs","88kgs","89kgs","90kgs","91kgs","92kgs","93kgs","94kgs","95kgs","96kgs","97kgs","98kgs","99kgs","100kgs","101kgs","102kgs","103kgs","104kgs","105kgs","106kgs","107kgs","108kgs","109kgs","110kgs","111kgs","112kgs","113kgs","114kgs","115kgs","116kgs","117kgs","118kgs","119kgs","120kgs","121kgs","122kgs","123kgs","124kgs","125kgs","126kgs","127kgs","128kgs","129kgs","130kgs","131kgs","132kgs","133kgs","134kgs","135kgs","136kgs","137kgs","138kgs","139kgs","140kgs","141kgs","142kgs","143kgs","144kgs","145kgs","146kgs","147kgs","148kgs","149kgs","150kgs","151kgs","152kgs","153kgs","154kgs","155kgs","156kgs","157kgs","158kgs","159kgs","160kgs","161kgs","162kgs","163kgs","164kgs","165kgs","166kgs","167kgs","168kgs","169kgs","170kgs","171kgs","172kgs","173kgs","174kgs","175kgs","176kgs","177kgs","178kgs","179kgs","180kgs","181kgs","182kgs","183kgs","184kgs","185kgs","186kgs","187kgs","188kgs","189kgs","190kgs","191kgs","192kgs","193kgs","194kgs","195kgs","196kgs","197kgs","198kgs","199kgs","200kgs"]
        
        bloodDrop.optionArray = ["O+ve","O-ve","A+ve","A-ve","B+ve","B-ve","AB+ve","AB-ve"]
        
        country.delegate = self
        
        heightDrop.didSelect{(selectHeight, index, id) in
        self.selectedHeight = selectHeight
            self.feet = self.changeFeet(selected: self.selectedHeight ?? "")
            self.inches = self.changeInch(selected: self.selectedHeight ?? "")
//            print("index \(id)")
            
            }

        weightDrop.didSelect { (selectWeight, index, id) in
            self.selectedWeight = selectWeight
//            let components = self.selectedWeight?.components(separatedBy: " ")
//            print("components \(components)")

        }
        bloodDrop.didSelect { (selectBlood, index, id) in
            self.selectedBlood = selectBlood
            
        }
//        showDatePicker()
        datePicker = UIDatePicker()
        dateText.inputView = datePicker
        datePicker.addTarget(self, action: #selector(handleDatePicker), for: UIControl.Event.valueChanged)
        datePicker.datePickerMode = .date

    }
    
//    @IBAction func datePicker(_ sender: UIButton) {
////        datePickerTapped()
//
//    }
    
    func changeFeet(selected:String) -> String{
        var feet:String?
        switch selected
        {
        case "3'0":
            feet = "3"
        case "3'1":
            feet = "3"
        case "3'2":
            feet = "3"
        case "3'3":
            feet = "3"
        case "3'4":
            feet = "3"
        case "3'5":
            feet = "3"
        case "3'6":
            feet = "3"
        case "3'7":
            feet = "3"
        case "3'8":
            feet = "3"
        case "3'9":
            feet = "3"
        case "3'10":
            feet = "3"
        case "3'11":
            feet = "3"
        case "4'0":
            feet = "4"
        case "4'1":
            feet = "4"
        case "4'2":
            feet = "4"
        case "4'3":
            feet = "4"
        case "4'4":
            feet = "4"
        case "4'5":
            feet = "4"
        case "4'6":
            feet = "4"
        case "4'7":
            feet = "4"
        case "4'8":
            feet = "4"
        case "4'9":
            feet = "4"
        case "4'10":
            feet = "4"
        case "4'11":
            feet = "4"
        case "5'0":
            feet = "5"
        case "5'1":
            feet = "5"
        case "5'2":
            feet = "5"
        case "5'3":
            feet = "5"
        case "5'4":
            feet = "5"
        case "5'5":
            feet = "5"
        case "5'6":
            feet = "5"
        case "5'7":
            feet = "5"
        case "5'8":
            feet = "5"
        case "5'9":
            feet = "5"
        case "5'10":
            feet = "5"
        case "5'11":
            feet = "5"
        case "6'0":
            feet = "6"
        case "6'1":
            feet = "6"
        case "6'2":
            feet = "6"
        case "6'3":
            feet = "6"
        case "6'4":
            feet = "6"
        case "6'5":
            feet = "6"
        case "6'6":
            feet = "6"
        case "6'7":
            feet = "6"
        case "6'8":
            feet = "6"
        case "6'9":
            feet = "6"
        case "6'10":
            feet = "6"
        case "6'11":
            feet = "6"
        case "7'0":
            feet = "7"
        case "7'1":
            feet = "7"
        case "7'2":
            feet = "7"
        case "7'3":
            feet = "7"
        case "7'4":
            feet = "7"
        case "7'5":
            feet = "7"
        case "7'6":
            feet = "7"
        case "7'7":
            feet = "7"
        case "7'8":
            feet = "7"
        case "7'9":
            feet = "7"
        case "7'10":
            feet = "7"
        case "7'11":
            feet = "7"
        default:
            break
        }
        return feet ?? ""
    }
    
    func changeInch(selected:String) -> String{
        var inch:String?
        switch selected
        {
        case "3'0":
            inch = "0"
        case "3'1":
            inch = "1"
        case "3'2":
            inch = "2"
        case "3'3":
            inch = "3"
        case "3'4":
            inch = "4"
        case "3'5":
            inch = "5"
        case "3'6":
            inch = "6"
        case "3'7":
            inch = "7"
        case "3'8":
            inch = "8"
        case "3'9":
            inch = "9"
        case "3'10":
            inch = "10"
        case "3'11":
            inch = "11"
        case "4'0":
            inch = "0"
        case "4'1":
            inch = "1"
        case "4'2":
            inch = "2"
        case "4'3":
            inch = "3"
        case "4'4":
            inch = "4"
        case "4'5":
            inch = "5"
        case "4'6":
            inch = "6"
        case "4'7":
            inch = "7"
        case "4'8":
            inch = "8"
        case "4'9":
            inch = "9"
        case "4'10":
            inch = "10"
        case "4'11":
            inch = "11"
        case "5'0":
            inch = "0"
        case "5'1":
            inch = "1"
        case "5'2":
            inch = "2"
        case "5'3":
            inch = "3"
        case "5'4":
            inch = "4"
        case "5'5":
            inch = "5"
        case "5'6":
            inch = "6"
        case "5'7":
            inch = "7"
        case "5'8":
            inch = "8"
        case "5'9":
            inch = "9"
        case "5'10":
            inch = "10"
        case "5'11":
            inch = "11"
        case "6'0":
            inch = "0"
        case "6'1":
            inch = "1"
        case "6'2":
            inch = "2"
        case "6'3":
            inch = "3"
        case "6'4":
            inch = "4"
        case "6'5":
            inch = "5"
        case "6'6":
            feet = "6"
        case "6'7":
            inch = "7"
        case "6'8":
            inch = "8"
        case "6'9":
            inch = "9"
        case "6'10":
            inch = "10"
        case "6'11":
            inch = "11"
        case "7'0":
            inch = "0"
        case "7'1":
            inch = "1"
        case "7'2":
            inch = "2"
        case "7'3":
            inch = "3"
        case "7'4":
            inch = "4"
        case "7'5":
            inch = "5"
        case "7'6":
            inch = "6"
        case "7'7":
            inch = "7"
        case "7'8":
            inch = "8"
        case "7'9":
            inch = "9"
        case "7'10":
            inch = "10"
        case "7'11":
            inch = "11"
        
        default:
            break
        }
        return inch ?? ""
    }
    @objc func handleDatePicker() {
        let dateFormatter = DateFormatter()
        let component = DateComponents()
        datePicker.maximumDate = Date()
        datePicker.minimumDate = component.date
        dateFormatter.dateFormat = "dd-MM-yyyy"
        if #available(iOS 13.4, *) {
            datePicker.preferredDatePickerStyle = UIDatePickerStyle.wheels
        } else {
            // Fallback on earlier versions
        }
        dateText.text = dateFormatter.string(from: datePicker.date)
        dateText.resignFirstResponder()
    }
    
//    func showDatePicker(){
//       //Formate Date
//       datePicker.datePickerMode = .date
//
//      //ToolBar
//      let toolbar = UIToolbar();
//      toolbar.sizeToFit()
//      let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donedatePicker));
//        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
//     let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker));
//
//    toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)
//
//     dateText.inputAccessoryView = toolbar
//     dateText.inputView = datePicker
//
//    }
//
//     @objc func donedatePicker(){
//
//      let formatter = DateFormatter()
//      formatter.dateFormat = "dd/MM/yyyy"
//      dateText.text = formatter.string(from: datePicker.date)
//      self.view.endEditing(true)
//    }
//
//    @objc func cancelDatePicker(){
//       self.view.endEditing(true)
//     }
   
//    func datePickerTapped() {
//        let currentDate = Date()
//        var dateComponents = DateComponents()
//        dateComponents.month = -3
////        let threeMonthAgo = Calendar.current.date(byAdding: dateComponents, to: currentDate)
//
//        datePicker.show("DatePickerDialog",
//                        doneButtonTitle: "Ok",
//                        cancelButtonTitle: "Cancel",
//                        minimumDate: dateComponents.date,
//                        maximumDate: currentDate,
//                        datePickerMode: .date) { (date) in
//            if let dt = date {
//                let formatter = DateFormatter()
//                formatter.dateFormat = "MM/dd/yyyy"
//                self.dateText.text = formatter.string(from: dt)
//            }
//        }
//    }

//
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
    
    @IBAction func next(_ sender: UIButton) {
        if dateText.text == nil{
            
        }
        else {
            
        performSegue(withIdentifier: "SignUp3", sender: self)
        }
    }
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SignUp3"
        {
            let vc = segue.destination as! SignUp3ViewController
            vc.fname = fname
            vc.lname = lname
            vc.gender = gender
            vc.blood = selectedBlood
            vc.country = countryName
            vc.height = selectedHeight
            vc.weight = selectedWeight
            vc.date = dateText.text
            vc.feet = feet
            vc.inches = inches
        }
    }
}
    
extension SignUp2ViewController: ADCountryPickerDelegate {
    
    func countryPicker(_ picker: ADCountryPicker, didSelectCountryWithName name: String, code: String, dialCode: String) {
        _ = picker.navigationController?.popToRootViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
//        countryNameLabel.text = name
//        countryCodeLabel.text = code
//        countryCallingCodeLabel.text = dialCode
        country.text = "\(name) \(code)"
        countryName = name
//        picker.defaultCountryCode = "IN"
       let x =  picker.getFlag(countryCode: code)
        let xx =  picker.getCountryName(countryCode: code)
        let xxx =  picker.getDialCode(countryCode: code)
    }
}

