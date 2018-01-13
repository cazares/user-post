//
//  UIAlertAction+Util.swift
//  UserPost
//
//  Created by Miguel Cazares on 1/12/18.
//  Copyright © 2018 Miguel Cazares. All rights reserved.
//

import Foundation

extension UIAlertAction {
    convenience init(title: String, handler: @escaping (UIAlertAction) -> ()) {
        self.init(title: title, style: .default, handler: handler)
    }
}
