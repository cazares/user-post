//
//  CreateNewPostViewController.swift
//  UserPost
//
//  Created by Miguel Cazares on 1/11/18.
//  Copyright © 2018 Miguel Cazares. All rights reserved.
//

import UIKit
import SwiftSpinner

class EditPostViewController: UIViewController {
    let cancelTitle = "Cancel"
    let saveTitle = "Save"
    let createNewTitle = "Create New Post"
    let editTitle = "Edit Post"
    let textViewHeight = 100.0
    let labelFontSize = 16.0
    let titleText = "Title:"
    let bodyText = "Body:"
    let labelHeight = 40.0
    let bodyCornerRadius = CGFloat(5.0)
    let savingPost = "Saving Post"
    
    var post: Post? {
        didSet {
            resetFields()
            resetTitle()
        }
    }
    
    var modifyType: ModifyPostType!
    
    private var postTitleLabel: BaseLabel!
    private var postTitleTextField = UITextField(frame: .zero)
    
    private var postBodyLabel: BaseLabel!
    private var postBodyTextView = UITextView(frame: .zero)

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViewController()
        setupViews()
    }
    
    private func setupViewController() {
        extendedLayoutIncludesOpaqueBars = false
        edgesForExtendedLayout = []
        view.backgroundColor = bgColor
        
        let cancelButton = UIBarButtonItem(title: cancelTitle, style: .plain, target: self, action: #selector(dismissViewController))
        navigationItem.leftBarButtonItem = cancelButton
        
        let saveButton = UIBarButtonItem(title: saveTitle, style: .done, target: self, action: #selector(savePost))
        navigationItem.rightBarButtonItem = saveButton
    }
    
    private func setupViews() {
        postTitleLabel = BaseLabel(fontSize: labelFontSize, text: titleText, view: view)
        postTitleTextField.translatesAutoresizingMaskIntoConstraints = false
        postTitleTextField.borderStyle = .roundedRect
        postTitleTextField.tintColor = .black
        postTitleTextField.returnKeyType = .next
        postTitleTextField.backgroundColor = .white
        postTitleTextField.clipsToBounds = true
        view.addSubview(postTitleTextField)
        
        postBodyLabel = BaseLabel(fontSize: labelFontSize, text: bodyText, view: view)
        postBodyTextView.translatesAutoresizingMaskIntoConstraints = false
        postBodyTextView.layer.cornerRadius = bodyCornerRadius
        view.addSubview(postBodyTextView)
        
        let views = [ "titleLabel": postTitleLabel,
                      "titleTextField": postTitleTextField,
                      "bodyLabel": postBodyLabel,
                      "bodyTextView": postBodyTextView ] as [String: AnyHashable]
        let metrics = [ "pad": padding,
                        "textViewHeight": textViewHeight,
                        "labelHeight": labelHeight ] as [String: AnyHashable]
        
        view.lhs_addConstraints("V:|-(pad)-[titleLabel(labelHeight)]-[titleTextField(labelHeight)]-[bodyLabel(labelHeight)]-[bodyTextView]-(pad)-|", metrics: metrics, views: views)
        
        setHorizontalConstraintsForView(postTitleLabel, metrics: metrics)
        setHorizontalConstraintsForView(postTitleTextField, metrics: metrics)
        setHorizontalConstraintsForView(postBodyLabel, metrics: metrics)
        setHorizontalConstraintsForView(postBodyTextView, metrics: metrics)
    }
    
    private func setHorizontalConstraintsForView(_ view: UIView, metrics: [String: AnyHashable]) {
        let views = [ "view": view ]
        self.view.lhs_addConstraints("H:|-(pad)-[view]-(pad)-|", metrics: metrics, views: views)
    }
    
    private func resetFields() {
        postTitleTextField.text = post?.title
        postBodyTextView.text = post?.body
    }
    
    private func resetTitle() {
        title = post == nil ? createNewTitle : editTitle
    }
    
    @objc
    func dismissViewController() {
        navigationController?.dismiss(animated: true, completion: nil)
    }
    
    @objc
    func savePost() {
        SwiftSpinner.show(savingPost)
        
        let onSuccess = {
            SwiftSpinner.hide()
            self.dismissViewController()
        }
        
        let onFailure: (Error) -> () = {
            error in
            print(error)
            SwiftSpinner.hide()
        }
        
        let newTitle = postTitleTextField.text == nil ? emptyString : postTitleTextField.text!
        let newBody = postBodyTextView.text == nil ? emptyString : postBodyTextView.text!
        if post == nil {
            post = Post()
        }
        post!.title = newTitle
        post!.body = newBody
        
        APIClient.modifyPost(post!, modifyPostType: modifyType, success: onSuccess, failure: onFailure)
    }
}
