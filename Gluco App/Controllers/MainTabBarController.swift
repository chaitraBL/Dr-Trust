//
//  MainTabBarController.swift
//  Gluco App
//
//  Created by Anjali on 6/7/21.
//

import UIKit
var newRefreshToken:String?
var userName:String?
class MainTabBarController: UITabBarController {

    var name:String?
    var refershToken:String?
    override func viewDidLoad() {
        super.viewDidLoad()

//        print("tabbar refresh token \(refershToken)")
//        print("tabbar name \(name)")
        newRefreshToken = refershToken
        userName = name
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
