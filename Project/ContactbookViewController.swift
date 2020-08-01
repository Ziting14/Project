//
//  ContactbookViewController.swift
//  Project
//
//  Created by MIS@NSYSU on 2020/5/6.
//  Copyright © 2020年 huihuiteam. All rights reserved.
//

import UIKit

var ListArray: NSArray = ["Hello world", "Swift", "UITableView", "媽!我在這裡"]

class contactcell: UITableViewCell{
    @IBOutlet weak var userphoto: UIImageView!
    @IBOutlet weak var username: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    override func setSelected( _ selected: Bool, animated: Bool){
        super.setSelected(selected, animated: animated)
    }
    
}

class contacttablecontroller: UITableViewController{

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ListArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = "\(ListArray.object(at: indexPath.row))"
        return cell
    }

}



class ContactbookViewController: UIViewController {

    
    @IBOutlet weak var contactv: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //把UITableView的dataSource與delegate指向給自己
        contactv.dataSource = self as? UITableViewDataSource
        contactv.delegate = self as! UITableViewDelegate
        
        func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
        
        
        // Do any additional setup after loading the view.
    }
    

    
}

