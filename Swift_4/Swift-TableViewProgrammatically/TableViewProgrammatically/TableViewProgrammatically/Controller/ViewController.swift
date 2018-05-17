//
//  ViewController.swift
//  TableViewProgrammatically
//
//  Created by Miguel Silva da Rocha Junior on 12/13/17.
//  Copyright © 2017 MiguelRochaJr. All rights reserved.
//

import UIKit

class PostsController: UITableViewController {
    
    let cellID = "post"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Gela Natal"
        
        tableView.register(PostCell.self, forCellReuseIdentifier: cellID)
        
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! PostCell
        cell.setCardDimensions(CGRect(x: 10, y: 10, width: view.frame.width-20, height: 160))
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
}



