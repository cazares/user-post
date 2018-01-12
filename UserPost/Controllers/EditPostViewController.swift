//
//  CreateNewPostViewController.swift
//  UserPost
//
//  Created by Miguel Cazares on 1/11/18.
//  Copyright © 2018 Miguel Cazares. All rights reserved.
//

import UIKit

enum postModes {
    case createNew
    case edit
}

class EditPostViewController: UIViewController {
    let cancelTitle = "Cancel"
    let saveTitle = "Save"
    let createNewTitle = "Create New Post"
    let editTitle = "Edit Post"
    
    var postMode: postModes! {
        didSet {
            resetTitle()
        }
    }
    
    var post = Post()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViewController()
    }
    
    private func setupViewController() {
        view.backgroundColor = backgroundColor
        
        let cancelButton = UIBarButtonItem(title: cancelTitle, style: .plain, target: self, action: #selector(dismissViewController))
        navigationItem.leftBarButtonItem = cancelButton
        
        let saveButton = UIBarButtonItem(title: saveTitle, style: .done, target: self, action: #selector(savePost))
        navigationItem.rightBarButtonItem = saveButton
    }
    
    private func resetTitle() {
        switch(postMode) {
        case .createNew:
            title = createNewTitle
            
        case .edit:
            title = editTitle
        
        default:
            title = createNewTitle
        }
    }
    
    public func dismissViewController() {
        navigationController?.dismiss(animated: true, completion: nil)
    }
    
    public func savePost() {
        dismissViewController()
    }
}
