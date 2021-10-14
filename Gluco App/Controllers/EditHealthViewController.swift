//
//  EditHealthViewController.swift
//  Gluco App
//
//  Created by Anjali on 29/6/21.
//

import UIKit
import iOSDropDown
class EditHealthViewController: UIViewController {

    @IBOutlet var heightDrop: DropDown!
    var height:String?
    var weight:String?
    var blood:String?
    @IBOutlet var bloodDrop: DropDown!
    @IBOutlet var weightDrop: DropDown!
    var selectedHeight:String?
    var selectedWeight:String?
    var selectedBlood:String?
    var profileArray:[String:Any] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        heightDrop.attributedText = NSAttributedString(string: height!)
        weightDrop.attributedText = NSAttributedString(string: weight!)
        bloodDrop.attributedText = NSAttributedString(string: blood!)
        heightDrop.optionArray = ["3'0","3'1","3'2","3'3","3'4","3'5","3'6","3'7","3'8","3'9","3'10","3'11","4'0","4'1","4'2","4'3","4'4","4'5","4'6","4'7","4'8","4'9","4'10","4'11","5'0","5'1","5'2","5'3","5'4","5'5","5'6","5'7","5'8","5'9","5'10","5'11","6'0","6'1","6'2","6'3","6'4","6'5","6'6","6'7","6'8","6'9","6'10","6'11","7'0","7'1","7'2","7'3","7'4","7'5","7'6","7'7","7'8","7'9","7'10","7'11"]
        weightDrop.optionArray = ["01kgs","02kgs","03kgs","04kgs","05kgs","06kgs","07kgs","08kgs","09kgs","10kgs","11kgs","12kgs","13kgs","14kgs","15kgs","16kgs","17kgs","18kgs","19kgs","20kgs","21kgs","22kgs","23kgs","24kgs","25kgs","26kgs","27kgs","28kgs","29kgs","30kgs","31kgs","32kgs","33kgs","34kgs","35kgs","36kgs","37kgs","38kgs","39kgs","40kgs","41kgs","42kgs","43kgs","44kgs","45kgs","46kgs","47kgs","48kgs","49kgs","50kgs","51kgs","52kgs","53kgs","54kgs","55kgs","56kgs","57kgs","58kgs","59kgs","60kgs","61kgs","62kgs","63kgs","64kgs","65kgs","66kgs","67kgs","68kgs","69kgs","70kgs","71kgs","72kgs","73kgs","74kgs","75kgs","76kgs","77kgs","78kgs","79kgs","80kgs","81kgs","82kgs","83kgs","84kgs","85kgs","86kgs","87kgs","88kgs","89kgs","90kgs","91kgs","92kgs","93kgs","94kgs","95kgs","96kgs","97kgs","98kgs","99kgs","100kgs","101kgs","102kgs","103kgs","104kgs","105kgs","106kgs","107kgs","108kgs","109kgs","110kgs","111kgs","112kgs","113kgs","114kgs","115kgs","116kgs","117kgs","118kgs","119kgs","120kgs","121kgs","122kgs","123kgs","124kgs","125kgs","126kgs","127kgs","128kgs","129kgs","130kgs","131kgs","132kgs","133kgs","134kgs","135kgs","136kgs","137kgs","138kgs","139kgs","140kgs","141kgs","142kgs","143kgs","144kgs","145kgs","146kgs","147kgs","148kgs","149kgs","150kgs","151kgs","152kgs","153kgs","154kgs","155kgs","156kgs","157kgs","158kgs","159kgs","160kgs","161kgs","162kgs","163kgs","164kgs","165kgs","166kgs","167kgs","168kgs","169kgs","170kgs","171kgs","172kgs","173kgs","174kgs","175kgs","176kgs","177kgs","178kgs","179kgs","180kgs","181kgs","182kgs","183kgs","184kgs","185kgs","186kgs","187kgs","188kgs","189kgs","190kgs","191kgs","192kgs","193kgs","194kgs","195kgs","196kgs","197kgs","198kgs","199kgs","200kgs"]
        
        bloodDrop.optionArray = ["O +ve","O -ve","A +ve","A -ve","B +ve","B -ve","AB +ve","AB -ve"]
        
        heightDrop.didSelect{(selectHeight, index, id) in
        self.selectedHeight = selectHeight
//            self.feet = self.changeFeet(selected: self.selectedHeight ?? "")
//            self.inches = self.changeInch(selected: self.selectedHeight ?? "")
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
    }
    

    @IBAction func save(_ sender: UIButton) {
//        Networking().updateProfile(parameter: <#T##String#>, value: <#T##String#>, token: <#T##String#>)
        profileArray = ["weight":selectedWeight!,"b_group":selectedBlood!,"height":selectedHeight!] as [String:Any]
        let headerpass = ["Authorization" : newToken!]
        Networking().updateProfile(parameter: profileArray, token: headerpass) { (data, error) in
            if ((data as? NSDictionary) != nil)
           {
            print("updated")
           }
        }
    }
    
    @IBAction func cancel(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
