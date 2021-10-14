//
//  ViewPrescriptionViewController.swift
//  Gluco App
//
//  Created by Anjali on 28/6/21.
//

import UIKit
import SDWebImage

class ViewPrescriptionViewController: UIViewController {

    @IBOutlet var prescritionImg: UIImageView!
    var selectedId:Int = 0
    var selectedImage:String?
    override func viewDidLoad() {
        super.viewDidLoad()

        let url = NSURL(string: selectedImage!)
        prescritionImg.sd_setImage(with: url as URL?, completed: nil)
//        print("img \(selectedId)")
//        Networking().viewPrescriptionImg(id: selectedId, token: newToken!) { (data, error) in
//            if let obj = data as? NSDictionary
//            {
////                let url = NSURL(string: obj["image_file"] as? String ?? "")
//                self.prescritionImg.image = UIImage(named: obj["image_file"] as! String)
//            }
//        }
    }
    

    @IBAction func deleteImg(_ sender: UIBarButtonItem) {
        alert(msg: "Are you sure want to delete prescription", id: selectedId)
    }
    

    func alert(msg:String, id: Int)
    {
        let alert = UIAlertController(title: "Alert!", message: msg, preferredStyle: .alert)
        let okay = UIAlertAction(title: "Yes", style: .default) { (alert) in
            Networking().deletePrescriptionImg(id: id, token: newToken!) { (data, error) in
                if let obj = data as? NSDictionary
                {
                    self.prescritionImg.image = UIImage(named: "")
                }
            }
        }
        
        let no = UIAlertAction(title: "No", style: .default, handler: nil)
            
        alert.addAction(okay)
        alert.addAction(no)
        present(alert, animated: true, completion: nil)
}
    
    @IBAction func share(_ sender: UIBarButtonItem) {
        let image = prescritionImg
//                let imageShare = [ image! ]
        // set up activity view controller
                let imageToShare = [ image! ]
                let activityViewController = UIActivityViewController(activityItems: imageToShare, applicationActivities: nil)
                activityViewController.popoverPresentationController?.sourceView = self.view // so that iPads won't crash
                
                // exclude some activity types from the list (optional)
                activityViewController.excludedActivityTypes = [ UIActivity.ActivityType.airDrop, UIActivity.ActivityType.postToFacebook ]
                
                // present the view controller
                self.present(activityViewController, animated: true, completion: nil)
    }
    

}
