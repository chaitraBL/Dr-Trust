//
//  PrescriptionViewController.swift
//  Gluco App
//
//  Created by Anjali on 4/6/21.
//

import UIKit
import Alamofire
import AlamofireImage
import SDWebImage

class PrescriptionViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var index = 0

    @IBOutlet var prescriptionCollectionView: UICollectionView!
    let picker = UIImagePickerController()
    var prescriptionObj:[prescriptionData] = []
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("count \(prescriptionObj.count)")
        return prescriptionObj.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "prescriptionCell", for: indexPath) as! PrescriptionCollectionViewCell
//        cell.prescriptionImg.image = UIImage(named: prescriptionObj[indexPath.row].imgFile!)
        let url = NSURL(string: prescriptionObj[indexPath.row].imgFile!)
//        cell.prescriptionImg.af_setImage(withURL: url! as URL , placeholderImage: nil, filter: nil, imageTransition: .crossDissolve(0.5), runImageTransitionIfCached: true, completion: nil)
//        if let imageurl = url
//        {
//        print("url \(url)")
        cell.prescriptionImg.sd_setImage(with: url as URL?, completed: nil)
//        }
                return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 500, height: 700)

    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        index = indexPath.row
        performSegue(withIdentifier: "selectedPrescription", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        picker.delegate = self
//        prescriptionCollectionView.delegate = self
//        prescriptionCollectionView.dataSource = self
        Networking().downloadPrescriptionImg(token: newToken!) { (data, error) in
            if let obj = data as? NSDictionary
            {
                let id = obj["id"] as? Int ?? 5
                let uid = obj["uid"] as? String ?? ""
                let imagefile = obj["image_file"] as? String ?? ""
                let created = obj["created_at"] as? String ?? ""
                let obj1 = prescriptionData(myid: id, uuid: uid, imagefile: imagefile, time1: created)
                
                self.prescriptionObj.append(obj1)
                print("count here \(self.prescriptionObj.count)")
                self.prescriptionCollectionView.reloadData()
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        Networking().downloadPrescriptionImg(token: newToken!) { (data, error) in
            if let obj = data as? NSDictionary
            {
                let id = obj["id"] as? Int ?? 5
                let uid = obj["uid"] as? String ?? ""
                let imagefile = obj["image_file"] as? String ?? ""
                let created = obj["created_at"] as? String ?? ""
                let obj1 = prescriptionData(myid: id, uuid: uid, imagefile: imagefile, time1: created)
                
                self.prescriptionObj.append(obj1)
                print("count here \(self.prescriptionObj.count)")
                self.prescriptionCollectionView.reloadData()
            }
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        Networking().downloadPrescriptionImg(token: newToken!) { (data, error) in
            if let obj = data as? NSDictionary
            {
                let id = obj["id"] as? Int ?? 5
                let uid = obj["uid"] as? String ?? ""
                let imagefile = obj["image_file"] as? String ?? ""
                let created = obj["created_at"] as? String ?? ""
                let obj1 = prescriptionData(myid: id, uuid: uid, imagefile: imagefile, time1: created)
                
                self.prescriptionObj.append(obj1)
                print("count here \(self.prescriptionObj.count)")
                self.prescriptionCollectionView.reloadData()
            }
        }
    }
    @IBAction func addPrescription(_ sender: UIButton) {
//        pickPhoto()
        showPhotoMenu()
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
        preferredStyle: .alert)

        let actCancel = UIAlertAction(title: "Cancel", style: .cancel,handler: nil)
        alert.addAction(actCancel)

        let actPhoto = UIAlertAction(title: "Camera",
        style: .default, handler: { _ in
            self.takePhotoWithCamera()
        })

        alert.addAction(actPhoto)

        let actLibrary = UIAlertAction(title: "Gallery",
        style: .default, handler: { _ in
            self.choosePhotoFromLibrary()
            })

        alert.addAction(actLibrary)

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

            //var newImage: UIImage
            //if let possibleImage = info[.editedImage] as? UIImage {
            //    newImage = possibleImage
            //} else if let possibleImage = info[.originalImage] as? UIImage {
            //    newImage = possibleImage
            //} else {
            //    return
            //}

            if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
//                let url = "https://glucometer.fabritronix.com/api/v1/auth/user/prescription/"
//                imageView.contentMode = .scaleAspectFit
//                imageView.image = pickedImage
//                print("image \(pickedImage)")
//                let stringImage = convertImageToBase64(image: pickedImage)
//                Networking().refreshToken(refreshToken: newToken!) { (data, error) in
//                    if let obj = data as? NSDictionary
//                    {
//                        newToken = obj["data"] as? String ?? ""
//                        print("new token \(newToken)")
//                        Networking().addPrescriptionImg(url: url, img: pickedImage, token: newToken!) { (data, error) in
//                            print("prescription data \(data)")
////                            if let obj = data as? NSDictionary
////                            {
////                                print("message \(obj["message"] as? String)")
////                            }
//                        }
                        
                        let parameters = ["key":"file",
                                          "src": pickedImage,
                      //                        "/Users/anjali/Downloads/invisible.png",
                                          "type":"file"
                        ] as [String : Any]
                                
                                let headerpass = ["Authorization" : newToken!]
                                    
//                                                  "Content-type": "multipart/form-data",
//                                    "Content-Disposition" : "form-data"]
                                let url = "https://glucometer.fabritronix.com/api/v1/auth/user/prescription/"
                               let img = "file"
                                         
                                
                                
                        
                Networking().postImageRequestWithURL(withUrl: url, withParam: [:], imageArray: pickedImage, imgparamname: img, header: headerpass) { (error, response) in
                                    if let error = error
                                    {
                                        print("error descrption = \(error)")
                                    }
                                    else
                                    {
                                        print("discrionary = \(String(describing: response))")
                                        //  self.getTicketDetails()
                                    }
                                    
                                }
                    }
        dismiss(animated: true, completion: nil)
                }
                
                
//                let url = "https://glucometer.fabritronix.com/api/v1/auth/user/prescription/"
//                //Parameter HERE
//                let parameters = [
//                    "key": "file",
//                        "src": pickedImage,
//    //                        "/Users/anjali/Downloads/invisible.png",
//                        "type": "file"
//                ] as [String : Any]
//                //Header HERE
//                let headers = [
//                    "token" : newToken,"Content-type": "multipart/form-data","Content-Disposition" : "form-data"]
//                Networking().multipleUpload(url: url, thumbImageArray: pickedImage, header: headers, parameter: parameters, jobid: newToken!) { (data, error) in
//                    print("data \(data)")
//                }
                
//            }

            
//        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            dismiss(animated: true, completion: nil)
        }

    func convertImageToBase64(image: UIImage) -> String {
            let imageData = image.pngData()!
            return imageData.base64EncodedString(options: Data.Base64EncodingOptions.lineLength64Characters)
        }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "selectedPrescription"
        {
            let vc = segue.destination as! ViewPrescriptionViewController
            vc.selectedId = prescriptionObj[index].id!
            vc.selectedImage = prescriptionObj[index].imgFile!
        }
    }

}
