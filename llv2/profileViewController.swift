//
//  profileViewController.swift
//  LunaLauren
//
//  Created by Luna Cao on 2018/7/16.
//  Copyright © 2018年 Luna Cao. All rights reserved.
//

import UIKit
import Firebase

class profileViewController: UIViewController {
    
    @IBOutlet weak var labelText: UILabel!
    
    @IBAction func handleLogout(_ sender: UIButton) {
        try! Auth.auth().signOut()
        self.performSegue(withIdentifier: "logoutSegue", sender: self)
    }
    
    @IBOutlet weak var profileImageView: UIImageView!
    
    var imagePicker: UIImagePickerController!
    


//      //upload image
//        self.uploadProfileImage(image){ url in
//            if url != nil{
//                print(url!)
//            }
//        }
//
//        }
//
//
//    func uploadProfileImage(_ image:UIImage, completion:@escaping((_ url:URL?) -> ())){
//
//        guard let uid = Auth.auth().currentUser?.uid else{
//            return
//        }
//                let storageRef = Storage.storage().reference().child("user/\(uid)")
//        guard let imageData = UIImageJPEGRepresentation(image, 0.75) else{
//            return
//        }
//
//        let metaData = StorageMetadata()
//        metaData.contentType = "image/jpg"
//
//        storageRef.putData(imageData,metadata:metaData){
//            metaData, error in
//
//            if error == nil, metaData != nil{
//                //success
//                storageRef.downloadURL{ (url,error) in
//                guard let downloadURL = url else{
//                    print("error")
//                    return
//                }
//                    if error != nil{
//                        completion(nil)
//                        return
//                    }
//                    completion(downloadURL)
//            }
//        }
//            else{
//                completion(nil)
//            }
//
//    }
//    }

    //upload
//    let storageRef = Storage.storage().reference().child("user/\(uid)")
//
//    //delete former one
//    //            storageRef.delete{
//    //            error in
//    //            if error != nil{
//    //            print("error deleting")
//    //            }
//    //            else{
//    //            }
//    //            }
//
//    guard let imageData = UIImageJPEGRepresentation(image, 0.75)
//    else{
//    return
//    }
//    let metaData = StorageMetadata()
    //            metaData.contentType = "image/jpg"
    //
    //            storageRef.putData(imageData, metadata: metaData){
    //            metaData, error in
    //            if error == nil, metaData != nil{
    //            //success
    //            storageRef.downloadURL{(url,error) in
    //            guard let downloadURL = url else{
    //            print("error")
    //            return
    //            }
    //            if error != nil{
    //            //error
    //            }
    //            let databaseRef = Database.database().reference().child("users/profile/\(uid)")
    //            databaseRef.updateChildValues(["photoURL": downloadURL])
    //            }
    //            }
    //            else{
    //            //error
    //            }
    //            }

    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.labelText.text = "欢迎，" + (Auth.auth().currentUser?.displayName)!
        
        guard let uid = Auth.auth().currentUser?.uid else{
            return
        }
        
        
        //handle showing the profile image
        let databaseRef = Database.database().reference().child("users/profile/\(uid)")
        let refHandle = databaseRef.observe(DataEventType.value, with:{
            (snapshot) in
            let curUser = snapshot.value as? NSDictionary
            let urlString = curUser?["photoURL"] as? String ?? ""

            let url = URL(string:urlString)
                let data = try? Data(contentsOf:url!)
                self.profileImageView.image = UIImage(data:data!)
            
            
        })
    
        imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}

extension profileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerEditedImage] as? UIImage{
            
            self.profileImageView.image = pickedImage
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    
}
