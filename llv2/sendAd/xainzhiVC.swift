//
//  xainzhiVC.swift
//  llv2
//
//  Created by 林蔼欣 on 2018-07-30.
//  Copyright © 2018 Luna Cao. All rights reserved.
//

import UIKit
import Firebase

class xainzhiVC: UIViewController {

    @IBOutlet weak var profilePic: UIImageView!
    
    
    @IBOutlet weak var uploadPic: UIButton!
    @IBOutlet weak var ensureChange: UIButton!
    
    var imagePicker: UIImagePickerController!
    
    
    @IBAction func upload(_ sender: UIButton) {
        self.present(imagePicker,animated:true,completion:nil)
    }
    
    
    @IBAction func ensure(_ sender: UIButton) {
        
        guard let image = profilePic.image else{
            //加alert
            print("先上传图片！！！！！！")
            return
        }
        
        self.uploadProfileImage(image){
            url in
            if url != nil{
                
                self.saveProfile(profileImageURL: url!){
                    success in
                    self.performSegue(withIdentifier: "changeReady", sender: self)
                }
                
            }
            else{
                //上传图片出现问题
            }
        }
    }
    
    
    func saveProfile(profileImageURL:URL, completion: @escaping((_ success:Bool)->())){
        
        guard let uid = Auth.auth().currentUser?.uid else{
            return
        }
        
        let databaseRef = Database.database().reference().child("users/profile/\(uid)")
        
        let newObj = ["photoURL": profileImageURL.absoluteString]
        
        databaseRef.updateChildValues(newObj){error,ref in
            completion(error == nil)
        }
        
    }
    
    
    
    func uploadProfileImage (_ image:UIImage, completion:@escaping((_ url:URL?) -> ())){
        
        guard let uid = Auth.auth().currentUser?.uid else{
            return
        }
        
        let storageRef = Storage.storage().reference().child("user/\(uid)")
        guard let imageData = UIImageJPEGRepresentation(image, 0.75) else{
            return
        }
        
        let metaData = StorageMetadata()
        metaData.contentType = "image/jpg"
        
        storageRef.putData(imageData,metadata:metaData){
            metaData, error in
            
            if error == nil, metaData != nil{
                storageRef.downloadURL{
                    (url, error) in
                    guard let downloadURL = url else{
                        print("error")
                        return
                    }
                    if error != nil{
                        completion(nil)
                        return
                    }
                    completion(downloadURL)
                }
            }
            else{
                completion(nil)
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self as! UIImagePickerControllerDelegate & UINavigationControllerDelegate
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
   
}

extension changePictureViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerEditedImage] as? UIImage{
            
            self.profilePic.image = pickedImage
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    

}
