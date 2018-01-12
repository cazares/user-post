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
    let editText = "Edit Post"
    let deleteText = "Delete Post"
    
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
        
        let actionSheet = UIAlertController(title: post.title, message: nil, preferredStyle: .actionSheet)
        let editAction = UIAlertAction(title: editText, style: .default, handler: { _ in
            self.editPostViewController.post = post
            self.editPostViewController.modifyType = ModifyPostType.Edit
            self.postsViewController.navigationController?.present(self.editPostNavController, animated: true, completion: nil)
        })
        actionSheet.addAction(editAction)
        
        let deleteAction = UIAlertAction(title: deleteText, style: .default, handler: { _ in
            self.deletePost(post)
        })
        actionSheet.addAction(deleteAction)
        
        postsViewController.navigationController?.present(actionSheet, animated: true, completion: nil)
    }
    
    private func deletePost(_ post: Post) {
        SwiftSpinner.show(deletingPost)
        
        let onSuccess: USPEmptyBlock = {
            _ in
            SwiftSpinner.hide()
            self.postsViewController.navigationController?.popViewController(animated: true)
        }
        let onFailure: USPErrorBlock = {
            print($0)
            SwiftSpinner.hide()
        }
        USPAPIClient.shared().modifyPost(with: post, modifyPostType: ModifyPostType.Delete, success: onSuccess, failure: onFailure)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
