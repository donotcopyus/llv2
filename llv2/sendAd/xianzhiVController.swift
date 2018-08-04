//
//  xianzhiVController.swift
//  llv2
//
//  Created by Luna Cao on 2018/8/3.
//  Copyright © 2018年 Luna Cao. All rights reserved.
//

import UIKit
import ImagePicker

class xianzhiVController: UIViewController,UITextViewDelegate,ImagePickerDelegate {
    
    func wrapperDidPress(_ imagePicker: ImagePickerController, images: [UIImage]) {
        
    }
    
    func doneButtonDidPress(_ imagePicker: ImagePickerController, images: [UIImage]) {
        
        //用户只上传了一张图片
        if (images.count == 1){
            self.image2.image = images[0]
            self.image.image = nil
            self.image3.image = nil
        }
            //两张
        else if (images.count == 2){
             self.image2.image = nil
            self.image.image = images[0]
            self.image3.image = images[1]
        }
            //三张
        else if(images.count == 3){
        self.image.image = images[0]
        self.image2.image = images[1]
        self.image3.image = images[2]
        }
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    func cancelButtonDidPress(_ imagePicker: ImagePickerController) {
     imagePicker.dismiss(animated:true,completion:nil)
    }
    
    
    
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var image2: UIImageView!
    
    @IBOutlet weak var image3: UIImageView!
    
    @IBOutlet weak var name: UITextField!
    
    @IBOutlet weak var price: UITextField!

    @IBOutlet weak var txtv: UITextView!
    
    //placeholder
  
    
    
    @IBAction func upload(_ sender: Any) {
        
        let imagePickerController = ImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.imageLimit = 3
        present(imagePickerController,animated: true, completion: nil)
        
        
    }
    
    
    
    @IBAction func handle(_ sender: Any) {
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

          txtv.text = "在这里填写详细信息"
          txtv.textColor = UIColor.lightGray
          txtv.returnKeyType = .done
          txtv.delegate = self
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == "在这里填写详细信息"{
            textView.text = ""
            textView.textColor = UIColor.black
        }
    }


    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n"{
            textView.resignFirstResponder()
        }
        return true
    }

}
