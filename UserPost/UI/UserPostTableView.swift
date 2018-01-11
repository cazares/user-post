//
//  UserPostTableView.swift
//  UserPost
//
//  Created by Miguel Cazares on 1/11/18.
//  Copyright © 2018 Miguel Cazares. All rights reserved.
//

import UIKit

class UserPostTableView: UITableView, UITableViewDataSource, UITableViewDelegate {
    let cellIdentifier = "cellIdentifier"
    let userRowHeight = CGFloat(120)
    
    var users = [User]() {
        didSet {
            reloadData()
        }
    }

    init() {
        super.init(frame: .zero, style: .grouped)
        translatesAutoresizingMaskIntoConstraints = false
        
        register(UserTableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        dataSource = self
        delegate = self
        backgroundColor = .white
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return userRowHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! UserTableViewCell
        
        let user = users[indexPath.row]
        cell.user = user
        
        return cell
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
