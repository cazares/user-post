//
//  PostViewController.swift
//  UserPost
//
//  Created by Miguel Cazares on 1/11/18.
//  Copyright © 2018 Miguel Cazares. All rights reserved.
//

import UIKit
import SwiftSpinner

class PostsViewController: SortListViewController {
    let loadingPosts = "Loading Posts"

    var user = User()! {
        didSet {
            setTitleFromUser()
            getPosts()
        }
    }
    
    var postTable = PostsTableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViewController()
        setupViews()
    }
    
    private func setupViewController() {
        view.backgroundColor = bgColor
        view.addSubview(postTable)
    }
    
    private func setupViews() {
        postTable.lhs_fillHeightOfSuperview()
        postTable.lhs_fillWidthOfSuperview()
        
        postTable.postsViewController = self
    }
    
    private func setTitleFromUser() {
        title = "Posts for: \(user.name)"
    }
    
    internal override func sortPostsWithAscending(_ ascending: Bool) {
        super.sortPostsWithAscending(ascending)
        
        self.postTable.posts.sort {
            ascending ? $0.title.localizedLowercase < $1.title.localizedLowercase : $0.title.localizedLowercase > $1.title.localizedLowercase
        }
        self.postTable.reloadData()
    }
    
    private func getPosts() {
        SwiftSpinner.show(loadingPosts)
        
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
