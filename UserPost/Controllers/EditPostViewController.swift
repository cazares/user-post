//
//  CreateNewPostViewController.swift
//  UserPost
//
//  Created by Miguel Cazares on 1/11/18.
//  Copyright © 2018 Miguel Cazares. All rights reserved.
//

import UIKit

class EditPostViewController: UIViewController {
    let cancelTitle = "Cancel"
    let saveTitle = "Save"
    let createNewTitle = "Create New Post"
    let editTitle = "Edit Post"
    let labelFontSize = 16.0
    let postTitleTitle = "Title:"
    let bodyTitle = "Body:"
    
    var post = Post()! {
        didSet {
            resetFields()
            resetTitle()
        }
    }
    
    private var postTitleLabel = BaseLabel(fontSize: labelFontSize, text: postTitleTitle, view: view)
    private var postTitleTextField = UITextField(frame: .zero)
    
    private var postBodyLabel = BaseLabel(fontSize: labelFontSize, text: bodyTitle, view: view)
    private var postBodyTextView = UITextView(frame: .zero)

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViewController()
    }
    
    private func setupViewController() {
        view.backgroundColor = backgroundColor
        
        postTitleTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(postTitleTextField)
        
        postBodyTextView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(postBodyTextView)
        
        let cancelButton = UIBarButtonItem(title: cancelTitle, style: .plain, target: self, action: #selector(dismissViewController))
        navigationItem.leftBarButtonItem = cancelButton
        
        let saveButton = UIBarButtonItem(title: saveTitle, style: .done, target: self, action: #selector(savePost))
        navigationItem.rightBarButtonItem = saveButton
    }
    
    private func resetFields() {
        postTitleTextField.text = post.title
        postBodyTextView.text = post.body
    }
    
    private func resetTitle() {
        title = post == nil ? createNewTitle : editTitle
    }
    
    public func dismissViewController() {
        navigationController?.dismiss(animated: true, completion: nil)
    }
    
    public func savePost() {
        dismissViewController()
    }
}
