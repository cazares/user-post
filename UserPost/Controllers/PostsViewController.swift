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

    var postTable = PostTableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(postTable)
        
        postTable.lhs_fillHeightOfSuperview()
        postTable.lhs_fillWidthOfSuperview()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        SwiftSpinner.show("Loading posts")
        
        let onSuccess: USPGenericBlock {
            posts in
            
        }
        
        USPAPIClient.shared().getPostsWithUserId(post?.userId, success: <#T##USPGenericBlock!##USPGenericBlock!##(Any?) -> Void#>, failure: <#T##USPErrorBlock!##USPErrorBlock!##(Error?) -> Void#>)
    }
}
