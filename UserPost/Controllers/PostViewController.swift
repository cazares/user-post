//
//  PostViewController.swift
//  UserPost
//
//  Created by Miguel Cazares on 1/11/18.
//  Copyright © 2018 Miguel Cazares. All rights reserved.
//

import UIKit

class PostViewController: UIViewController {

    var postTable = PostTableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(postTable)
        
        postTable.lhs_fillHeightOfSuperview()
        postTable.lhs_fillWidthOfSuperview()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}
