//
//  UserTableViewCell.swift
//  UserPost
//
//  Created by Miguel Cazares on 1/11/18.
//  Copyright © 2018 Miguel Cazares. All rights reserved.
//

import UIKit

class UserTableViewCell: BaseTableViewCell {
    var user = User()! {
        didSet {
            labelText = user.name
            detailText = user.address!.description
        }
    }
}
