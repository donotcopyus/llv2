//
//  TableViewCell1.swift
//  llv2
//
//  Created by 林蔼欣 on 2018-07-25.
//  Copyright © 2018 Luna Cao. All rights reserved.
//

import UIKit
import Firebase

class TableViewCell1: UITableViewCell {

    @IBOutlet weak var image1: UIImageView!

    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    
    @IBOutlet weak var headImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var namePrice: UILabel!
    @IBOutlet weak var extraInfo: UILabel!
    

    @IBOutlet weak var id: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    
    
    @IBOutlet weak var collectionID: UILabel!
    var liked = false
    

    @IBAction func like(_ sender: UIButton) {
        

        //没like过,添加like
        if(liked == false){
            
        guard let uid = Auth.auth().currentUser?.uid else{
            return
        }
        let userLikeRef = Database.database().reference().child("users/collection/xianzhi/").childByAutoId()

        guard let pid = self.id.text else{
            return
        }
            let likeObj = [
                "type":"xianzhi",
                "pid": pid,
                "uid": uid
                ] as [String:Any]
            
            userLikeRef.setValue(likeObj,withCompletionBlock:{
                error, ref in
                
                if error == nil{
                    //alert
                    self.collectionID.text = ref.key
                    print("收藏成功")
                }
                
                else{
                    //alert
                    print("出错")
                    return}})

            likeButton.setTitle("❤️", for: .normal)
            
            liked = true

    }
    
        else if(liked == true){
            
            liked = false
            likeButton.setTitle("💗", for: .normal)
            
            guard let cid = self.collectionID.text else{
                return
            }
            
                     let userLikeRef = Database.database().reference().child("users/collection/xianzhi/\(cid)")
           userLikeRef.removeValue()

    }
    
    }

}

