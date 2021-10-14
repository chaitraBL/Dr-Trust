//
//  SecondLoginViewController.swift
//  Gluco App
//
//  Created by edgefinity on 27/07/21.
//

import UIKit
import SkyFloatingLabelTextField

class SecondLoginViewController: UIViewController {

    @IBOutlet var name: UILabel!
    
    @IBOutlet var password: SkyFloatingLabelTextField!
    
    @IBOutlet var showHidePassword: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func notYou(_ sender: UIButton) {
    }
    
  
    @IBAction func forgotPassword(_ sender: UIButton) {
    }
    
    @IBAction func login(_ sender: UIButton) {
    }
    
    
    @IBAction func hideShowPassword(_ sender: UIButton) {
    }
    
}
