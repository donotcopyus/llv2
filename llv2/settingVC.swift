//
//  settingVC.swift
//  llv2
//
//  Created by 林蔼欣 on 2018-07-23.
//  Copyright © 2018 Luna Cao. All rights reserved.
//

import UIKit

class settingVC: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil);
    }
    
//
//    @IBAction func jj(_ sender: Any) {
//        let settingPage = sendAdViewContronller()
//        self.navigationController?.pushViewController(settingPage, animated: true)
//    }


}
