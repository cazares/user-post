//
//  PostViewController.swift
//  UserPost
//
//  Created by Miguel Cazares on 1/11/18.
//  Copyright © 2018 Miguel Cazares. All rights reserved.
//

import UIKit
import SwiftSpinner
import LionheartExtensions

class PostsViewController: SortListViewController {
    let loadingPosts = "Loading Posts"

    var user: User! {
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
        postTable.fillHeightOfSuperview()
        postTable.fillWidthOfSuperview()
        
        postTable.postsViewController = self
    }
    
    private func setTitleFromUser() {
        title = "Posts for: \(user.name)"
    }
    
    override func sortPostsWithAscending(_ ascending: Bool) {
        super.sortPostsWithAscending(ascending)
        
        self.postTable.posts.sort {
            ascending ? $0.title.localizedLowercase < $1.title.localizedLowercase : $0.title.localizedLowercase > $1.title.localizedLowercase
        }
        self.postTable.reloadData()
    }
    
    private func getPosts() {
        SwiftSpinner.show(loadingPosts)
        
        let onSuccess: ([Post]) -> () = {
            posts in
            SwiftSpinner.hide()
            self.postTable.posts = posts
        }
        let onFailure: (Error) -> () = {
            error in
            print(error)
            SwiftSpinner.hide()
        }
        
        APIClient.getPosts(userId: user.id, success: onSuccess, failure: onFailure)
    }
}
