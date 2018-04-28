//
//  StoredFilesViewController.swift
//  Spartan_Drive
//
//  Created by Zelda on 4/27/18.
//  Copyright © 2018 CmpE137. All rights reserved.
//

import UIKit

class StoredFilesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var imageList: [String]!
    var count = 0;
    
    func storeImageNames( imageNames: String)
    {
        imageList[count] = imageNames;
        count = count + 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return(imageList.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = imageList[indexPath.row]
        
        return(cell)
    }
}
