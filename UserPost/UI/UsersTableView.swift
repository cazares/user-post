//
//  UserPostTableView.swift
//  UserPost
//
//  Created by Miguel Cazares on 1/11/18.
//  Copyright © 2018 Miguel Cazares. All rights reserved.
//

import UIKit

class UsersTableView: UITableView, UITableViewDataSource, UITableViewDelegate {
    let cellIdentifier = "usersTableViewCellIdentifier"
    let userRowHeight = CGFloat(120)
    
    var postViewController = PostsViewController()
    weak var usersViewController: UsersViewController!
    
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
        backgroundColor = backgroundColor
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let user = users[indexPath.row]
        postViewController.user = user
        usersViewController.navigationController?.pushViewController(postViewController, animated: true)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
