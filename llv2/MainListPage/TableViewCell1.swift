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
    
<<<<<<< HEAD
    @IBOutlet weak var id: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    
    @IBOutlet weak var collectionID: UILabel!
    
    var liked = false
    
=======
>>>>>>> parent of a38e6b8... Merge branch 'master' of https://github.com/donotcopyus/llv2
    @IBAction func like(_ sender: UIButton) {
        
        
        
<<<<<<< HEAD
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
                    print("收藏成功" + ref.key)
                }
                
                else{
                    //alert
                    print("出错")
                    return
                }})
            
            liked = true
            likeButton.setTitle("❤️", for: .normal)
=======
        
>>>>>>> parent of a38e6b8... Merge branch 'master' of https://github.com/donotcopyus/llv2
    }
    
    
<<<<<<< HEAD
//            let userLikeRef = Database.database().reference().child("users/collection/xianzhi/")
//            guard let pid = self.id.text else{
//                return
//            }
//
//            userLikeRef.observe(.value, with: { (snapshot) in
//
//                for child in snapshot.children{
//
//                    }
//                }
//
//
//                )
            
            
    }
        

}
=======
>>>>>>> parent of a38e6b8... Merge branch 'master' of https://github.com/donotcopyus/llv2
}
