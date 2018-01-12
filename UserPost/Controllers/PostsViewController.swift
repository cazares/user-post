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
    let loadingPosts = "Loading Posts"
    let sortTitle = "Sort"
    let ascendingTitle = "Sort Ascending"
    let descendingTitle = "Sort Descending"

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
        
        let sortButton = UIBarButtonItem(title: sortTitle, style: .done, target: self, action: #selector(sortButtonPressed))
        navigationItem.rightBarButtonItem = sortButton
    }
    
    private func setupViews() {
        postTable.lhs_fillHeightOfSuperview()
        postTable.lhs_fillWidthOfSuperview()
        
        postTable.postsViewController = self
    }
    
    private func setTitleFromUser() {
        title = "Posts for: \(user.name)"
    }
    
    public func sortButtonPressed() {
        let actionSheet = UIAlertController(title: user.name, message: nil, preferredStyle: .actionSheet)
        let ascendingAction = UIAlertAction(title: ascendingTitle, style: .default, handler: { _ in
            self.sortPostsWithAscending(true)
        })
        actionSheet.addAction(ascendingAction)
        
        let descendingAction = UIAlertAction(title: descendingTitle, style: .default, handler: { _ in
            self.sortPostsWithAscending(false)
        })
        actionSheet.addAction(descendingAction)
        
        let cancelAction = UIAlertAction(title: cancel, style: .cancel, handler:nil)
        actionSheet.addAction(cancelAction)
        
        navigationController?.present(actionSheet, animated: true, completion: nil)
    }
    
    private func sortPostsWithAscending(_ ascending: Bool) {
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
