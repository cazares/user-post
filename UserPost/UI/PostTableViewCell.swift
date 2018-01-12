//
//  PostTableViewCell.swift
//  UserPost
//
//  Created by Miguel Cazares on 1/11/18.
//  Copyright © 2018 Miguel Cazares. All rights reserved.
//

import UIKit

class PostTableViewCell: BaseTableViewCell {
    var post: Post! {
        didSet {
            labelText = post.title
            detailText = post.body
        }
    }
}
