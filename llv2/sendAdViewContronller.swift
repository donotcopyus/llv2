//
//  sendAdViewContronller.swift
//  LunaLauren
//
//  Created by 林蔼欣 on 2018-07-08.
//  Copyright © 2018 Luna Cao. All rights reserved.
//

import UIKit

class sendAdViewContronller: UIViewController {

    @IBOutlet weak var back: UIButton!
    
    
    @IBAction func `return`(_ sender: UIButton) {
   self.navigationController?.popViewController(animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //以下为lauren改动： ----------------------------------------------
    @IBAction func carpoolAd(_ sender: Any) {
    }
    @IBAction func xianzhiAd(_ sender: Any) {
    }
    
    @IBAction func otherAd(_ sender: Any) {
    }
    
    //click to turn to carpool section
    @IBAction func turnCarpoolAd(_ sender: UIButton) {
        let carpoolAd = carpoolAdViewController()
        self.navigationController?.pushViewController(carpoolAd, animated: true)
    }
    
    //button to go back to main
    
    @IBAction func back(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    

    
    
    
//    //click to turn to xianzhi section
//    @IBAction func TurnXianzhi(_ sender: UIButton) {
//        let xianzhiView = xianzhiViewController()
//        self.navigationController?.pushViewController(xianzhiView, animated: true)
//    }
//    
//    //click to turn to other section
//    @IBAction func TurnOther(_ sender: UIButton) {
//        let otherView = otherViewController()
//        self.navigationController?.pushViewController(otherView, animated: true)
//    }
    
    //至此-----------------------------------------------------------
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
