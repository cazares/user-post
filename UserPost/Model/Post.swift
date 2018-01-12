//
//  Post.swift
//  UserPost
//
//  Created by Miguel Cazares on 1/11/18.
//  Copyright © 2018 Miguel Cazares. All rights reserved.
//

import UIKit
import Mantle

class Post: MTLModel, MTLJSONSerializing {
    var body = emptyString
    var userId = 0
    var title = emptyString
    var id = 0
    
    override init() {
        super.init()
    }
    
    init(title: String, body: String) {
        super.init()
        self.title = title
        self.body = body
    }
    
    public static func jsonKeyPathsByPropertyKey() -> [AnyHashable : Any]! {
        return [ "body": "body",
                 "userId": "userId",
                 "title": "title",
                 "id": "id" ]
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }   
}
