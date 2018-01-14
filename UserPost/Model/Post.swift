//
//  Post.swift
//  UserPost
//
//  Created by Miguel Cazares on 1/11/18.
//  Copyright © 2018 Miguel Cazares. All rights reserved.
//

import UIKit

struct Post: Codable {
    var body: String
    let userId: Int
    var title: String
    let id: Int
    
    enum PostKeys: String, CodingKey {
        case body, userId, title, id
    }
}

extension Post {
    init() {
        body = emptyString
        userId = 0
        title = emptyString
        id = 0
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: PostKeys.self)
        var body = emptyString
        var userId = 0
        var title = emptyString
        var id = 0
        
        do {
            userId = try container.decode(Int.self, forKey: .userId)
            id = try container.decode(Int.self, forKey: .id)
            body = try container.decode(String.self, forKey: .body)
            title = try container.decode(String.self, forKey: .title)
        } catch (let error) {
            print(error)
        }
        self.init(body: body, userId: userId, title: title, id: id)
    }
}
