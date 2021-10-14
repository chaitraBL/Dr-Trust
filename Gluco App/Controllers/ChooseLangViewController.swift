//
//  ChooseLangViewController.swift
//  Gluco App
//
//  Created by Anjali on 8/7/21.
//https://stackoverflow.com/questions/9416923/ios-how-to-change-app-language-programmatically-without-restarting-the-app

import UIKit

class ChooseLangViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func chooseEnglish(_ sender: UIButton) {
        // This is done so that network calls now have the Accept-Language as "hi" (Using Alamofire) Check if you can remove these
            UserDefaults.standard.set(["en"], forKey: "AppleLanguages")
            UserDefaults.standard.synchronize()

            // Update the language by swaping bundle
            Bundle.setLanguage("en")

            // Done to reintantiate the storyboards instantly
            let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
            UIApplication.shared.keyWindow?.rootViewController = storyboard.instantiateInitialViewController()

    }
    
    @IBAction func chooseHindi(_ sender: UIButton) {
        // This is done so that network calls now have the Accept-Language as "hi" (Using Alamofire) Check if you can remove these
            UserDefaults.standard.set(["hi"], forKey: "AppleLanguages")
            UserDefaults.standard.synchronize()

            // Update the language by swaping bundle
            Bundle.setLanguage("hi")

            // Done to reintantiate the storyboards instantly
            let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
            UIApplication.shared.keyWindow?.rootViewController = storyboard.instantiateInitialViewController()

    }
    
}
