//
//  SideMenuViewController.swift
//  Gluco App
//
//  Created by Anjali on 4/6/21.
//

import UIKit
import SDWebImage

class SideMenuViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIPopoverPresentationControllerDelegate {
    
    @IBOutlet var sideColView: UICollectionView!
    @IBOutlet var profileImg: UIImageView!
    @IBOutlet var email: UILabel!
    @IBOutlet var name: UILabel!
    let picker = UIImagePickerController()
    
    
    var index = 0
    


    @IBAction func profile(_ sender: UIButton) {
        self.performSegue(withIdentifier: "toProfile", sender: self)
    }
    
    @IBAction func prescription(_ sender: UIButton) {
        self.performSegue(withIdentifier: "toPrescription", sender: self)
    }
    
    @IBAction func log(_ sender: UIButton) {
        self.performSegue(withIdentifier: "logs", sender: self)
    }
    
    @IBAction func help(_ sender: UIButton) {
        performSegue(withIdentifier: "toHelp", sender: self)
    }
    
    @IBAction func exit1(_ sender: UIButton) {
        let alert = UIAlertController(title: "Alert!", message: "Are you sure want to exit app?", preferredStyle: .alert)
        let no = UIAlertAction(title: "No", style: .default, handler: nil)
        let yes = UIAlertAction(title: "Yes", style: .default) { (alert) in
            exit(0)
        }
        alert.addAction(no)
        alert.addAction(yes)
        self.present(alert, animated: true, completion: nil)
//        UIApplication.shared.perform(#selector(NSXPCConnection.suspend))
    }
    @IBAction func bgRemainder(_ sender: UIButton) {
        index = 6
        performSegue(withIdentifier: "toViewremainders", sender: self)
    }
    @IBAction func notification(_ sender: UIButton) {
        performSegue(withIdentifier: "toNotification", sender: self)
    }
    
    @IBAction func doctor(_ sender: UIButton) {
        index = 5
        performSegue(withIdentifier: "toContacts", sender: self)
    }
    
    @IBAction func medicine(_ sender: UIButton) {
        index = 7
        performSegue(withIdentifier: "toViewremainders", sender: self)
    }
    @IBAction func contact(_ sender: UIButton) {
        index = 3
        performSegue(withIdentifier: "toContacts", sender: self)
    }
    @IBAction func about(_ sender: UIButton) {
        performSegue(withIdentifier: "toAbout", sender: self)
    }
    
    @IBAction func language(_ sender: UIButton) {
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "LnaguageChange") as! ChooseLangViewController

        vc.modalPresentationStyle = UIModalPresentationStyle.popover
        vc.popoverPresentationController?.permittedArrowDirections = .any
//        vc.preferredContentSize.height = 400
//
//        vc.preferredContentSize.width = 300
        vc.popoverPresentationController?.delegate = self
        vc.popoverPresentationController?.sourceView = sender
//            vc.popoverPresentationController?.sourceRect = indexPath.row
        vc.popoverPresentationController?.sourceRect = CGRect(x: 100, y: 400, width: 300, height: 200)
        self.present(vc, animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.isNavigationBarHidden = false
        if Reachability.isConnectedToNetwork(){
        Networking().profileData(token: newToken!) { (data, error) in
            if let obj = data as? NSDictionary{
                self.name.text = obj["fname"] as? String ?? ""
                 ?? ""
                self.email.text = obj["email"] as? String ?? ""
               
            }
        }
        
        Networking().getProfilePic(token: newToken!) { (data, error) in
            if let mydata = data as? NSDictionary
            {
                let image = mydata["profile_pic"] as? String ?? ""
                let convertedImage = self.convertBase64ToImage(imageString: image)
                print("imagr \(convertedImage)")
                self.profileImg.image = convertedImage
            }
        }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toContacts"
        {
            let dest = segue.destination as? ContactsViewController
            dest?.index1 = index
        }
        else if segue.identifier == "toViewremainders"
        {
            let dest = segue.destination as? ViewReminderViewController
            dest?.indexVal = index
        }
    }
    


    @IBAction func logout(_ sender: UIButton) {
        let alert = UIAlertController(title: "Alert!", message: "Are you sure want to logout", preferredStyle: .alert)
       
       let ok = UIAlertAction(title: "YES", style: .default, handler: { action in
           
           self.performSegue(withIdentifier: "loginPage", sender: self)
       })
       alert.addAction(ok)
       let cancel = UIAlertAction(title: "NO", style: .default, handler: { action in
           
       })
       alert.addAction(cancel)
       DispatchQueue.main.async(execute: {
           self.present(alert, animated: true)
       })
    }
    
    @IBAction func profilePicSelect(_ sender: UIButton) {
        pickPhoto()
    }
    

    func pickPhoto() {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            showPhotoMenu()
        } else {
            choosePhotoFromLibrary()
        }
    }

    func showPhotoMenu() {
        let alert = UIAlertController(title: "Upload Prescriptions!", message: nil,
        preferredStyle: .actionSheet)

        let actRemove = UIAlertAction(title: "Remove", style: .default) { _ in
            self.removeImg()
        }
        alert.addAction(actRemove)
        let actLibrary = UIAlertAction(title: "Gallery",
        style: .default, handler: { _ in
            self.choosePhotoFromLibrary()
            })

        alert.addAction(actLibrary)
        
        let actPhoto = UIAlertAction(title: "Camera",
        style: .default, handler: { _ in
            self.takePhotoWithCamera()
        })

        alert.addAction(actPhoto)

        let actCancel = UIAlertAction(title: "Cancel", style: .cancel,handler: nil)
        alert.addAction(actCancel)
        
        present(alert, animated: true, completion: nil)
    }
    
    func takePhotoWithCamera()
    {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerController.SourceType.camera
        imagePicker.allowsEditing = false
        self.present(imagePicker, animated: true, completion: nil)
        }

    }
    
    
    func choosePhotoFromLibrary()
    {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary){
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
            imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
        self.present(imagePicker, animated: true, completion: nil)
        }

    }
    
    func imagePickerController(_ picker: UIImagePickerController,
            didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {

           

        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            let profile_image = convertImageToBase64(image: pickedImage)
            Networking().profilePic(profile: profile_image, token: newToken!) { (data, error) in
                if let error = error
                {
                    print("error descrption = \(error)")
                }
                else
                {
                    print("discrionary = \(String(describing: data))")
                    //  self.getTicketDetails()
                }
            }
        }
        dismiss(animated: true, completion: nil)
                }
                
              

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            dismiss(animated: true, completion: nil)
        }

    func convertImageToBase64(image: UIImage) -> String {
            let imageData = image.pngData()!
            return imageData.base64EncodedString(options: Data.Base64EncodingOptions.lineLength64Characters)
        }
    
    func convertBase64ToImage(imageString: String) -> UIImage {
            let imageData = Data(base64Encoded: imageString, options: Data.Base64DecodingOptions.ignoreUnknownCharacters)!
            return UIImage(data: imageData)!
        }
    
    func removeImg()
    {
        Networking().deleteProfileImg(token: newToken!) { (data, error) in
            if let obj = data as? NSDictionary
            {
                let message = obj["data"] as? String ?? ""
                let alert = UIAlertController(title: "Alert!", message: message, preferredStyle: .alert)
                let ok = UIAlertAction(title: "Ok", style: .default, handler: nil)
                alert.addAction(ok)
            }
        }
    }

    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.none
    }

}


