//
//  SignUp1ViewController.swift
//  Gluco App
//
//  Created by Anjali on 4/6/21.
//

import UIKit

class SignUp1ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var errorLabel1: UILabel!
    @IBOutlet var firstName: UITextField!
    
    @IBOutlet var errorLabel2: UILabel!
    @IBOutlet var lastName: UITextField!
    
    @IBOutlet var femaleLAbel: UILabel!
    @IBOutlet var maleGender: UIButton!
    
    @IBOutlet var maleLabel: UILabel!
    @IBOutlet var femaleGender: UIButton!
    var selected:String?
    let radioController = RadioButtonController()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        errorLabel2.isHidden = true
        errorLabel1.isHidden = true
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 0))
        imageView.contentMode = .scaleAspectFill
            let image = UIImage(named: "App-Icon-2")
            imageView.image = image
            navigationItem.titleView = imageView
        
        firstName.delegate = self
        lastName.delegate = self
        
        radioController.buttonsArray = [maleGender,femaleGender]
//        radioController.defaultButton = maleGender

    }
    
    @IBAction func maleSelected(_ sender: UIButton) {
        radioController.buttonArrayUpdated(buttonSelected: sender)
        selected = maleLabel.text
      
    }
    @IBAction func femaleSelected(_ sender: UIButton) {
        radioController.buttonArrayUpdated(buttonSelected: sender)
        selected = femaleLAbel.text
        
        
    }
    @IBAction func nextData(_ sender: UIButton) {
        if firstName.text == nil
        {
            errorLabel1.isHidden = false
            errorLabel1.text = "Field can't be empty"
            errorLabel1.textColor = .red
            
        }
        else if lastName.text == nil
        {
            errorLabel2.isHidden = false
            errorLabel2.text = "Field can't be empty"
            errorLabel2.textColor = .red
        }
        else if selected == nil
        {
            let alert = UIAlertController(title: "Alert!", message: "Please select gender", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
        else if (firstName.text!.count < 3)
        {
            errorLabel1.isHidden = false
            errorLabel1.text = "Name should be 3 characters"
            errorLabel1.textColor = .red
        }
        else if (lastName.text!.count < 3)
        {
            errorLabel2.isHidden = false
            errorLabel2.text = "Name should be 3 characters"
            errorLabel2.textColor = .red
        }
        else
        {
            performSegue(withIdentifier: "signUp2", sender: self)
        }
    }
    
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        if (firstName.text!.count < 3) || (lastName.text!.count < 3) {
//            errorLabel1.text = "Name should be 3 characters"
//            errorLabel2.text = "Name should be 3 characters"
//            errorLabel1.textColor = .red
//            errorLabel2.textColor = .red
//            return false
//        }
//        return true
//    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "signUp2"{
            let vc = segue.destination as! SignUp2ViewController
            vc.fname = firstName.text
            vc.lname = lastName.text
            vc.gender = selected
        }
    }
    
}
