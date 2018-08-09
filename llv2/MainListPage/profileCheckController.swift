//
//  profileCheckController.swift
//  llv2
//
//  Created by Luna Cao on 2018/8/8.
//  Copyright © 2018年 Luna Cao. All rights reserved.
//

import UIKit
import Firebase

class profileCheckController: UIViewController {
    
    
    
    @IBAction func back(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    @IBOutlet weak var uidLabel: UILabel!
    
    
    var uid = String()

    
    override func viewDidLoad() {
 
        super.viewDidLoad()

        //self.uidLabel.isHidden = true
        self.uidLabel.text = uid

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
