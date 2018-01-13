//
//  Post.swift
//  UserPost
//
//  Created by Miguel Cazares on 1/11/18.
//  Copyright © 2018 Miguel Cazares. All rights reserved.
//

import UIKit

struct Post: Decodable {
    var body: String
    let userId: Int
    var title: String
    let id: Int
    
    enum PostKeys: String, CodingKey {
        case body, userId, title, id
    }
    
    init() {
        body = emptyString
        userId = 0
        title = emptyString
        id = 0
    }
    
    init(body: String, userId: Int, title: String, id: Int) {
        self.body = body
        self.userId = userId
        self.title = title
        self.id = id
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: PostKeys.self)
        
        let body = try container.decode(String.self, forKey: .body)
        let userId = try container.decode(Int.self, forKey: .userId)
        let title = try container.decode(String.self, forKey: .title)
        let id = try container.decode(Int.self, forKey: .id)
        
        self.init(body: body, userId: userId, title: title, id: id)
    }
}
