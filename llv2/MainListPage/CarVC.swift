//
//  CarpoolVC.swift
//  llv2
//
//  Created by 林蔼欣 on 2018-07-28.
//  Copyright © 2018 Luna Cao. All rights reserved.
//

import UIKit

struct carpoolData{
    
    let cell: Int!
    let name: String!
    let image: UIImage!
    let sendtime: String!
    let roadline: String!
    let seatnum: String!
    let gotime: String!
    
    
}


class CarVC: UITableViewController {
    
    var arrayOfCellData = [carpoolData]()

    override func viewDidLoad() {
        arrayOfCellData = [carpoolData(cell: 1, name: "用户名", image:#imageLiteral(resourceName: "IMG_5333-1") , sendtime:"刚刚发送", roadline:"P城去G港", seatnum:"剩余座位数", gotime:"今晚出发" )]
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfCellData.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("TableViewCell2", owner: self, options: nil)?.first as! TableViewCell2
        cell.headImage.image = arrayOfCellData[indexPath.row].image
        cell.nameLabel.text = arrayOfCellData[indexPath.row].name
        cell.gotimeLabel.text = arrayOfCellData[indexPath.row].gotime
        cell.seatLabel.text = arrayOfCellData[indexPath.row].seatnum
        cell.sendTimeLabel.text = arrayOfCellData[indexPath.row].sendtime
        cell.mapLabel.text = arrayOfCellData[indexPath.row].roadline
        return cell

    }


    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 101.5
    }
    
}
