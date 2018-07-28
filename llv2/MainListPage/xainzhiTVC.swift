//
//  xainzhiTVC.swift
//  llv2
//
//  Created by 林蔼欣 on 2018-07-25.
//  Copyright © 2018 Luna Cao. All rights reserved.
//

//import Foundation
import UIKit

struct cellData{
    
    let cell: Int!
    let text: String!
    let image: UIImage!
    
}

class xianzhiTVC: UITableViewController{
    
    var arrayOfCellData = [cellData]()
    
    override func viewDidLoad() {
        arrayOfCellData = [cellData(cell: 1, text: "用户名", image:#imageLiteral(resourceName: "IMG_5333-1") )]
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfCellData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      //  if arrayOfCellData[indexPath.row].cell == 1 {
            let cell = Bundle.main.loadNibNamed("TableViewCell1", owner: self, options: nil)?.first as! TableViewCell1
            cell.image1.image = arrayOfCellData[indexPath.row].image
            cell.image2.image = arrayOfCellData[indexPath.row].image
            cell.image3.image = arrayOfCellData[indexPath.row].image
            cell.headImage.image = arrayOfCellData[indexPath.row].image
            cell.nameLabel.text = arrayOfCellData[indexPath.row].text
            
            return cell
       // } else
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 165
    }
    
    
    
    
    
    
}
