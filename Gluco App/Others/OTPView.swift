//
//  OTPView.swift
//  Gluco App
//
//  Created by Anjali on 10/6/21.
//

import Foundation
import UIKit

class OTPView: UIStackView {

    var textFieldArray = [OTPTextField]()
    var numberOfOTPdigit = 4
    

    
    override init(frame: CGRect) {
        super.init(frame: frame)

        setupStackView()
        setTextFields()
    }

    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupStackView()
        setTextFields()
    }

    private func setupStackView() {
        self.backgroundColor = .clear
        self.isUserInteractionEnabled = true
        self.translatesAutoresizingMaskIntoConstraints = false
        self.contentMode = .center
        self.distribution = .fillEqually
        self.spacing = 5
    }

    private func setTextFields() {
        for i in 0..<numberOfOTPdigit {
            let field = OTPTextField()

            textFieldArray.append(field)
            addArrangedSubview(field)
            field.delegate = self
            field.backgroundColor = UIColor.gray
            field.layer.opacity = 0.5
            field.textAlignment = .center
            field.layer.shadowColor = UIColor.black.cgColor
            field.layer.shadowOpacity = 0.1
            field.layer.borderColor = UIColor.black.cgColor

            i != 0 ? (field.previousTextField = textFieldArray[i-1]) : ()
            i != 0 ? (textFieldArray[i-1].nextTextFiled = textFieldArray[i]) : ()
        }
    }
}

 

extension OTPView: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let field = textField as? OTPTextField else {
            return true
        }
        if !string.isEmpty {
            field.text = string
//            otpdata = field.text
            field.resignFirstResponder()
            field.nextTextFiled?.becomeFirstResponder()
           
            return true
        }
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("text field printing the value = \(textField.text)")
        let obj = OTPVerification(myotp: textField.text!)
        otpdata.append(obj)
        print("count = \(otpdata.count)")
        
    }
}



class OTPTextField: UITextField {
    var previousTextField: UITextField?
    var nextTextFiled: UITextField?

    override func deleteBackward() {
        text = ""
        previousTextField?.becomeFirstResponder()
    }
}


//import Foundation
//import UIKit

//protocol OTPDelegate: class {
//    //always triggers when the OTP field is valid
//    func didChangeValidity(isValid: Bool)
//}
//
//
//class OTPStackView: UIStackView  {
//
//    //Customise the OTPField here
//    let numberOfFields = 4
//    var textFieldsCollection: [OTPTextField] = []
//    weak var delegate: OTPDelegate?
//    var showsWarningColor = false
//
//    //Colors
//    let inactiveFieldBorderColor = UIColor(white: 1, alpha: 0.3)
//    let textBackgroundColor = UIColor(white: 1, alpha: 0.5)
//    let activeFieldBorderColor = UIColor.black
//    var remainingStrStack: [String] = []
//
//    required init(coder: NSCoder) {
//        super.init(coder: coder)
//    }
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setupStackView()
//        addOTPFields()
//    }
//
//    //Customisation and setting stackView
//    private final func setupStackView() {
//        self.backgroundColor = .clear
//        self.isUserInteractionEnabled = true
//        self.translatesAutoresizingMaskIntoConstraints = false
//        self.contentMode = .center
//        self.distribution = .fillEqually
//        self.spacing = 5
//    }
//
//    //Adding each OTPfield to stack view
//    private final func addOTPFields() {
//        for index in 0..<numberOfFields{
//            let field = OTPTextField()
//            setupTextField(field)
//            textFieldsCollection.append(field)
//            //Adding a marker to previous field
//            index != 0 ? (field.previousTextField = textFieldsCollection[index-1]) : (field.previousTextField = nil)
//            //Adding a marker to next field for the field at index-1
//            index != 0 ? (textFieldsCollection[index-1].nextTextField = field) : ()
//        }
//        textFieldsCollection[0].becomeFirstResponder()
//    }
//
//    //Customisation and setting OTPTextFields
//    private final func setupTextField(_ textField: OTPTextField){
//        textField.delegate = self
//        textField.translatesAutoresizingMaskIntoConstraints = false
//        self.addArrangedSubview(textField)
//        textField.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
//        textField.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
//        textField.widthAnchor.constraint(equalToConstant: 40).isActive = true
////        textField.backgroundColor = textBackgroundColor
//        textField.textAlignment = .center
//        textField.adjustsFontSizeToFitWidth = false
//        textField.font = UIFont(name: "Kefa", size: 40)
//        textField.textColor = .white
//        textField.layer.cornerRadius = 5
//        textField.layer.borderWidth = 2
//        textField.layer.borderColor = activeFieldBorderColor.cgColor
//        textField.keyboardType = .numberPad
//        textField.autocorrectionType = .yes
//        textField.textContentType = .oneTimeCode
//    }
//
//    //checks if all the OTPfields are filled
//    private final func checkForValidity(){
//        for fields in textFieldsCollection{
//            if (fields.text == ""){
//                delegate?.didChangeValidity(isValid: false)
//                return
//            }
//        }
//        delegate?.didChangeValidity(isValid: true)
//    }
//
//    //gives the OTP text
//    final func getOTP() -> String {
//        var OTP = ""
//        for textField in textFieldsCollection{
//            OTP += textField.text ?? ""
//        }
//        return OTP
//    }
//
//    //set isWarningColor true for using it as a warning color
//    final func setAllFieldColor(isWarningColor: Bool = false, color: UIColor){
//        for textField in textFieldsCollection{
//            textField.layer.borderColor = color.cgColor
//        }
//        showsWarningColor = isWarningColor
//    }
//
//    //autofill textfield starting from first
//    private final func autoFillTextField(with string: String) {
//        remainingStrStack = string.reversed().compactMap{String($0)}
//        for textField in textFieldsCollection {
//            if let charToAdd = remainingStrStack.popLast() {
//                textField.text = String(charToAdd)
//            } else {
//                break
//            }
//        }
//        checkForValidity()
//        remainingStrStack = []
//    }
//
//}
//
////MARK: - TextField Handling
//extension OTPStackView: UITextFieldDelegate {
//
//    func textFieldDidBeginEditing(_ textField: UITextField) {
//        if showsWarningColor {
//            setAllFieldColor(color: inactiveFieldBorderColor)
//            showsWarningColor = false
//        }
//        textField.layer.borderColor = activeFieldBorderColor.cgColor
//    }
//
//    func textFieldDidEndEditing(_ textField: UITextField) {
//        checkForValidity()
//        textField.layer.borderColor = inactiveFieldBorderColor.cgColor
//    }
//
//    //switches between OTPTextfields
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range:NSRange,
//                   replacementString string: String) -> Bool {
//        guard let textField = textField as? OTPTextField else { return true }
//        if string.count > 1 {
//            textField.resignFirstResponder()
//            autoFillTextField(with: string)
//            return false
//        } else {
//            if (range.length == 0){
//                if textField.nextTextField == nil {
//                    textField.text? = string
//                    textField.resignFirstResponder()
//                }else{
//                    textField.text? = string
//                    textField.nextTextField?.becomeFirstResponder()
//                }
//                return false
//            }
//            return true
//        }
//    }
//
//}
//
//class OTPTextField: UITextField {
//  weak var previousTextField: OTPTextField?
//  weak var nextTextField: OTPTextField?
//  override public func deleteBackward(){
//    text = ""
//    previousTextField?.becomeFirstResponder()
//   }
//}

