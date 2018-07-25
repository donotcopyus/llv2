//
//  changePictureViewController.swift
//  llv2
//
//  Created by Luna Cao on 2018/7/25.
//  Copyright © 2018年 Luna Cao. All rights reserved.
//

import UIKit
import Firebase

class changePictureViewController: UIViewController {
    
    
    @IBOutlet weak var profilePic: UIImageView!
    
    
    @IBOutlet weak var uploadPic: UIButton!
    @IBOutlet weak var ensureChange: UIButton!
    
    var imagePicker: UIImagePickerController!
    
    
    @IBAction func upload(_ sender: UIButton) {
        self.present(imagePicker,animated:true,completion:nil)
    }
    

    @IBAction func ensure(_ sender: UIButton) {
        
        guard let image = profilePic.image else{
            return
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

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

