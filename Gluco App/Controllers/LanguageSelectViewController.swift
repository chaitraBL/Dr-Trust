//
//  LanguageSelectViewController.swift
//  Gluco App
//
//  Created by Anjali on 26/6/21.
//

import UIKit
import LanguageManager_iOS

class LanguageSelectViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
        

    var dictLanguage = [String:String]()
    var selectedLanguage: String = ""
    var language = ["English", "हिन्दी"]
//    let radioController = RadioButtonController()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dictLanguage.keys.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "languageCell")
        cell?.textLabel?.text = Array(dictLanguage)[indexPath.row].value
        return cell!
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        if indexPath.row == 0
//        {
            
//            LanguageManager.shared.setLanguage(language: .en)
//            { title -> UIViewController in
//              let storyboard = UIStoryboard(name: "Main", bundle: nil)
//              // the view controller that you want to show after changing the language
//              return storyboard.instantiateInitialViewController()!
//            } animation: { view in
//              // do custom animation
//              view.transform = CGAffineTransform(scaleX: 2, y: 2)
//              view.alpha = 0
            if selectedLanguage != dictLanguage[UserDefaults.standard.object(forKey: "Language") as! String]
                {
                    if selectedLanguage == "English"
                    {
                        UserDefaults.standard.set("en", forKey: "Language")
//                        UIView.appearance().semanticContentAttribute = .forceLeftToRight
                    }
                    else
                    {
                        UserDefaults.standard.set("hi", forKey: "Language")
//                        UIView.appearance().semanticContentAttribute = .forceRightToLeft
                    }
                    let objStoryboard = UIStoryboard.init(name: "Main", bundle: nil)
                    let rootNav = objStoryboard.instantiateViewController(withIdentifier: "rootNav") as! UINavigationController
                    UIApplication.shared.keyWindow?.rootViewController = rootNav
                    UIApplication.shared.keyWindow?.makeKeyAndVisible()
                    let objListStoryboard = UIStoryboard.init(name: "Main", bundle: nil)
                    let objListVC = objListStoryboard.instantiateViewController(withIdentifier: "MainView") as! ViewController
                    rootNav.pushViewController(objListVC, animated: true)
                }
                else
                {
                    let objListStoryboard = UIStoryboard.init(name: "Main", bundle: nil)
                    let objListVC = objListStoryboard.instantiateViewController(withIdentifier: "MainView") as! ViewController
                    present(objListVC, animated: true, completion: nil)
//                    self.navigationController!.pushViewController(objListVC, animated: true)
                }

//            }

//            LanguageManager.shared.setLanguage(language: .en)
//            {
//                _ in
//                let vc = UIStoryboard(name: "Main", bundle: nil)
//                return vc.instantiateViewController(identifier: "MainView")
////                    self.storyboard?.instantiateViewController(withIdentifier: "MainView") as! ViewController
////                let appDlg = UIApplication.shared.delegate as? AppDelegate
////                appDlg?.window?.rootViewController = vc
////                return (appDlg?.window?.rootViewController)!
//            } animation: { (view) in
//                view.transform = CGAffineTransform(scaleX: 2, y: 2)
//                view.alpha = 0
//            }
//            let lang = "en"
//            let defaults = UserDefaults.standard
//            defaults.set(lang, forKey: "AppleLanguage")
//            defaults.synchronize()
//            Bundle.setLanguage(lang)
//
//            let vc = self.storyboard?.instantiateViewController(withIdentifier: "MainView") as! ViewController
//            let appDlg = UIApplication.shared.delegate as? AppDelegate
//            appDlg?.window?.rootViewController = vc

        
//        else{
//    if selectedLanguage != dictLanguage[UserDefaults.standard.object(forKey: "Language") as! String]
//        {
//            if selectedLanguage == "हिन्दी"
//            {
//                UserDefaults.standard.set("hi", forKey: "Language")
////                        UIView.appearance().semanticContentAttribute = .forceLeftToRight
//            }
//            else
//            {
//                UserDefaults.standard.set("en", forKey: "Language")
//                UIView.appearance().semanticContentAttribute = .forceRightToLeft
//            }
//            let objStoryboard = UIStoryboard.init(name: "Main", bundle: nil)
//            let rootNav = objStoryboard.instantiateViewController(withIdentifier: "rootNav") as! UINavigationController
//            UIApplication.shared.keyWindow?.rootViewController = rootNav
//            UIApplication.shared.keyWindow?.makeKeyAndVisible()
//            let objListStoryboard = UIStoryboard.init(name: "Main", bundle: nil)
//            let objListVC = objListStoryboard.instantiateViewController(withIdentifier: "MainView") as! ViewController
//            rootNav.pushViewController(objListVC, animated: true)
//        }
//        else
//        {
//            let objListStoryboard = UIStoryboard.init(name: "Main", bundle: nil)
//            let objListVC = objListStoryboard.instantiateViewController(withIdentifier: "language") as! LanguageSelectViewController
//            present(objListVC, animated: true, completion: nil)
////            self.navigationController!.pushViewController(objListVC, animated: true)
//        }
//    }
//            LanguageManager.shared.setLanguage(language: .hi)
//            { title -> UIViewController in
//              let storyboard = UIStoryboard(name: "Main", bundle: nil)
//              // the view controller that you want to show after changing the language
//              return storyboard.instantiateInitialViewController()!
//            } animation: { view in
//              // do custom animation
//              view.transform = CGAffineTransform(scaleX: 2, y: 2)
//              view.alpha = 0
//            }

//            LanguageManager.shared.setLanguage(language: .hi)
//            {
//                _ in
//                let vc = UIStoryboard(name: "Main", bundle: nil)
//                return vc.instantiateViewController(identifier: "MainView")
//            } animation: { (view) in
//                view.transform = CGAffineTransform(scaleX: 2, y: 2)
//                view.alpha = 0
//            }

        
//            let lang = "hi"
//            let defaults = UserDefaults.standard
//            defaults.set(lang, forKey: "AppleLanguage")
//            defaults.synchronize()
//            Bundle.setLanguage(lang)
//
//
//                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "MainView") as! ViewController
//                    let appDlg = UIApplication.shared.delegate as? AppDelegate
//                    appDlg?.window?.rootViewController = vc
//        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        
        dictLanguage = ["en" : "English", "hi":"हिन्दी"]

    }
    
    override func viewWillAppear(_ animated: Bool) {
//        self.tblLanguage.reloadData()
            selectedLanguage = dictLanguage[UserDefaults.standard.object(forKey: "Language") as! String]!
//            lblTitle.text = AppHelper.getLocalizeString(str: "Choose Language")
//            btnNext.setTitle(AppHelper.getLocalizeString(str: "Next"), for: .normal)
    }
    

    

}

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
