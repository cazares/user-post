//
//  ViewController.swift
//  UserPost
//
//  Created by Miguel Cazares on 1/11/18.
//  Copyright © 2018 Miguel Cazares. All rights reserved.
//

import UIKit
import SwiftSpinner

class UsersViewController: UIViewController {

    let viewTitle = "Users"
    let searchWidth = CGFloat(300)
    let searchHeight = CGFloat(34)
    let userTable = UserPostTableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = viewTitle
        
        view.backgroundColor = .white
        
        userTable.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(userTable)
        
        userTable.lhs_fillWidthOfSuperview()
        userTable.lhs_fillHeightOfSuperview()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let onSuccess: USPGenericBlock = {
            users in
            SwiftSpinner.hide()
            self.userTable.users = users as! [User]
        }
        let onFailure: USPErrorBlock = {
            print($0)
            SwiftSpinner.hide()
        }
        SwiftSpinner.show("Getting users")
        USPAPIClient.shared().getUsersWithSuccess(onSuccess, failure: onFailure)
    }
}

