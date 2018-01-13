//
//  ViewController.swift
//  UserPost
//
//  Created by Miguel Cazares on 1/11/18.
//  Copyright © 2018 Miguel Cazares. All rights reserved.
//

import UIKit
import SwiftSpinner

class UsersViewController: SortListViewController {

    let viewTitle = "Users"
    let userTable = UsersTableView()
    let gettingUsers = "Getting Users"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = viewTitle
        
        view.backgroundColor = bgColor
        
        userTable.usersViewController = self
        view.addSubview(userTable)
        
        userTable.lhs_fillWidthOfSuperview()
        userTable.lhs_fillHeightOfSuperview()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let onSuccess: ([User]) -> () = {
            users in
            SwiftSpinner.hide()
            self.userTable.users = users
        }
        let onFailure: (Error) -> () = {
            print($0)
            SwiftSpinner.hide()
        }
        SwiftSpinner.show(gettingUsers)
        APIClient.getUsers(success: onSuccess, failure: onFailure)
    }
    
    override func sortPostsWithAscending(_ ascending: Bool) {
        super.sortPostsWithAscending(ascending)
        
        self.userTable.users.sort {
            ascending ? $0.name.localizedLowercase < $1.name.localizedLowercase : $0.name.localizedLowercase > $1.name.localizedLowercase
        }
        self.userTable.reloadData()
    }
}

