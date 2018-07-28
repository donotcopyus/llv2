
//  CarpoolViewController.swift
//  LunaLauren
//
//  Created by 林蔼欣 on 2018-07-25.
//  Copyright © 2018年 Luna Cao. All rights reserved.
//

import UIKit

struct cellData2{
    
    let cell: Int!
    let name: String!
    let image: UIImage!
    let sendtime: String!
    let roadline: String!
    let seatnum: String!
    let gotime: String!
    
    
}


class CarpoolVC: UITableViewController {
    
    var arrayOfCellData = [cellData2]()
    
    override func viewDidLoad() {
        arrayOfCellData = [cellData2(cell: 1, name: "用户名", image:#imageLiteral(resourceName: "IMG_5333-1"), sendtime:"刚刚发送", roadline:"P城去G港", seatnum:"剩余座位数", gotime:"今晚出发" )]
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfCellData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //  if arrayOfCellData[indexPath.row].cell == 1 {
        let cell = Bundle.main.loadNibNamed("TableViewCell2", owner: self, options: nil)?.first as! TableViewCell2
        cell.headImage.image = arrayOfCellData[indexPath.row].image
        cell.nameLabel.text = arrayOfCellData[indexPath.row].name
        cell.gotimeLabel.text = arrayOfCellData[indexPath.row].name
        cell.seatLabel.text = arrayOfCellData[indexPath.row].seatnum
        cell.sendTimeLabel.text = arrayOfCellData[indexPath.row].sendtime
        cell.mapLabel.text = arrayOfCellData[indexPath.row].roadline
        return cell
        // } else
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 165
    }
    
    
    
    
    //button to go back to the main
    //    @IBOutlet weak var back: UIButton!
    //    @IBAction func goBack(_ sender: UIButton) {
    //        self.navigationController?.popViewController(animated: true)
    //    }
    
}
