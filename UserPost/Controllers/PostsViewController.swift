//
//  PostViewController.swift
//  UserPost
//
//  Created by Miguel Cazares on 1/11/18.
//  Copyright © 2018 Miguel Cazares. All rights reserved.
//

import UIKit
import SwiftSpinner

class PostsViewController: UIViewController {

    var user = User()! {
        didSet {
            setTitleFromUser()
            getPosts()
        }
    }
    
    var postTable = PostsTableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(postTable)
        
        postTable.lhs_fillHeightOfSuperview()
        postTable.lhs_fillWidthOfSuperview()
    }
    
    private func setTitleFromUser() {
        title = "Posts for: \(user.name)"
    }
    
    private func getPosts() {
        SwiftSpinner.show("Loading posts")
        
        let onSuccess: USPGenericBlock = {
            posts in
            SwiftSpinner.hide()
            self.postTable.posts = posts as! [Post]
        }
        let onFailure: USPErrorBlock = {
            print($0)
            SwiftSpinner.hide()
        }
        
        USPAPIClient.shared().getPostsWithUserId(user.id, success: onSuccess, failure: onFailure)
    }
}
