//
//  PostTableView.swift
//  UserPost
//
//  Created by Miguel Cazares on 1/11/18.
//  Copyright © 2018 Miguel Cazares. All rights reserved.
//

import UIKit
import SwiftSpinner

class PostsTableView: UITableView, UITableViewDelegate, UITableViewDataSource {
    let cellIdentifier = "postTableViewCellIdentifier"
    let postRowHeight = CGFloat(100.0)
    let deletingPost = "Deleting Post"
    let editTitle = "Edit Post"
    let deleteTitle = "Delete Post"
    let deleteMessage = "Are you sure you want to delete this post?"
    
    weak var postsViewController: PostsViewController!
    private var editPostViewController = EditPostViewController()
    private var editPostNavController: UINavigationController!
    
    var posts = [Post]() {
        didSet {
            reloadData()
        }
    }
    
    init() {
        super.init(frame: .zero, style: .grouped)
        translatesAutoresizingMaskIntoConstraints = false
        
        register(PostTableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        dataSource = self
        delegate = self
        backgroundColor = bgColor
        
        editPostNavController = UINavigationController(rootViewController: editPostViewController)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return postRowHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! PostTableViewCell
        
        let post = posts[indexPath.row]
        cell.post = post
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        deselectRow(at: indexPath, animated: true)
        
        let post = posts[indexPath.row]
        
        let editHandler: (UIAlertAction) -> () = { _ in
            self.editPostViewController.post = post
            self.editPostViewController.modifyType = ModifyPostType.Edit
            self.postsViewController.navigationController?.present(self.editPostNavController, animated: true, completion: nil)
        }
        let deleteHandler: (UIAlertAction) -> () = { _ in
            let onConfirm: (UIAlertAction) -> () = { _ in
                self.deletePost(post)
            }
            UIAlertController.showAlert(title: self.deleteTitle, message: self.deleteMessage, viewController: self.postsViewController, onConfirm: onConfirm)
        }
        
        UIAlertController.showDualActionWithCancelSheet(title: post.title, firstActionTitle: editTitle, firstActionHandler: editHandler, secondActionTitle: deleteTitle, secondActionHandler: deleteHandler, viewController: postsViewController)
    }
    
    private func deletePost(_ post: Post) {
        SwiftSpinner.show(deletingPost)
        
        let onSuccess = {
            SwiftSpinner.hide()
            self.postsViewController.navigationController?.popViewController(animated: true)
        }
        let onFailure: (Error) -> () = {
            error in
            print(error)
            SwiftSpinner.hide()
        }
        APIClient.modifyPost(post, modifyPostType: .Delete, success: onSuccess, failure: onFailure)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
