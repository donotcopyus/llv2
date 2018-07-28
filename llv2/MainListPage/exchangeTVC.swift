//
//  exchangeTVC.swift
//  llv2
//
//  Created by 林蔼欣 on 2018-07-28.
//  Copyright © 2018 Luna Cao. All rights reserved.
//

import UIKit

struct exchangeData {
    let cell: Int!
    let name: String!
    let image: UIImage!
    let time: String!
    let detail: String!
}

class exchangeTVC: UITableViewController {
    
    var arrayOfCellData = [exchangeData]()
    
    override func viewDidLoad() {
        arrayOfCellData = [exchangeData(cell: 1, name: "迪迦奥特曼", image: #imageLiteral(resourceName: "IMG_5333-1"), time: "下午三点", detail: "求RMB，出加币")]
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfCellData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("TableViewCell3", owner: self, options: nil)?.first as! TableViewCell3
        
        cell.mainimage.image = arrayOfCellData[indexPath.row].image
        cell.mainlabel.text = arrayOfCellData[indexPath.row].name
        cell.sendtimelb.text = arrayOfCellData[indexPath.row].time
        cell.detaillb.text = arrayOfCellData[indexPath.row].detail
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
  

}
