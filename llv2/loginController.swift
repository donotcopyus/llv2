//
//  loginController.swift
//  LunaLauren
//
//  Created by Luna Cao on 2018/7/11.
//  Copyright © 2018年 Luna Cao. All rights reserved.
//

import UIKit
import Firebase

class loginController: UIViewController {
    
    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var passField: UITextField!
    
    @IBOutlet weak var labelText: UILabel!
    
    
    @IBAction func handleSignin(_ sender: UIButton) {
        
        guard let email = emailField.text else{
            return
        }
        
        guard let pass = passField.text else{
            return
        }
        
        Auth.auth().signIn(withEmail: email, password:pass){
            user, error in
            if error == nil && user != nil{
                self.performSegue(withIdentifier: "profileViewController", sender: self)
            }
            else{
                self.labelText.text = "登录失败，用户名或密码错误"
            }
        }
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        
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
