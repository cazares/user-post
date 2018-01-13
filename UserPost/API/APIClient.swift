//
//  APIClient.swift
//  UserPost
//
//  Created by Miguel Cazares on 1/13/18.
//  Copyright © 2018 Miguel Cazares. All rights reserved.
//

import UIKit
import Alamofire

enum ApiError: Error {
    case getUsersParseError
    case getPostsParseError
    case modifyPostError
}

enum ModifyPostType {
    case CreateNew
    case Edit
    case Delete
}

class APIClient: SessionManager {
    static let baseUrl = "https://mobile-code-test.ifactornotifi.com/json"
    static let usersUrl = "users"
    static let postsUrl = "posts"

    static func getUsers(success: @escaping ([User]) -> (), failure: @escaping (Error) -> ()) {
        Alamofire.request("\(baseUrl)/\(usersUrl)")
        .responseJSON { response in
            APIClient.handleGetUsers(response: response, success: success, failure: failure)
        }
    }
    
    private static func handleGetUsers(response: DataResponse<Any>, success: @escaping ([User]) -> (), failure: @escaping (Error) -> ()) {
        if response.result.isFailure {
            failure(response.error!)
            return
        }
        do {
            let users = try JSONDecoder().decode([User].self, from: response.data!)
            success(users)
        } catch {
            failure(ApiError.getUsersParseError)
        }
    }
    
    static func getPosts(userId: Int, success: @escaping ([Post]) -> (), failure: @escaping (Error) -> ()) {
        Alamofire.request("\(baseUrl)/\(postsUrl)")
            .responseJSON { response in
                APIClient.handleGetPosts(response: response, success: success, failure: failure)
        }
    }
    
    private static func handleGetPosts(response: DataResponse<Any>, success: @escaping ([Post]) -> (), failure: @escaping (Error) -> ()) {
        if response.result.isFailure {
            failure(response.error!)
            return
        }
        do {
            let posts = try JSONDecoder().decode([Post].self, from: response.data!)
            success(posts)
        } catch {
            failure(ApiError.getPostsParseError)
        }
    }
    
    static func modifyPost(_ post: Post, modifyPostType: ModifyPostType, success: @escaping () -> (), failure: @escaping (Error) -> ()) {
        Alamofire.request("\(baseUrl)/\(postsUrl)")
            .responseJSON { response in
                APIClient.handleModifyPost(response: response, success: success, failure: failure)
        }
        var url = postsUrl
        var httpMethod: HTTPMethod = .post
        
        switch modifyPostType {
        case .CreateNew:
            httpMethod = .post
            
        case .Edit:
            httpMethod = .put
            url = "\(url)/\(post.id)"
            
        case .Delete:
            httpMethod = .delete
            url = "\(url)/\(post.id)"
        }
        
        let params = [ "title": post.title,
                       "body": post.body ]
        
        Alamofire.request("\(baseUrl)/\(url)", method: httpMethod, parameters: params, encoding: JSONEncoding.default, headers: [:])
            .responseJSON { response in
                APIClient.handleModifyPost(response: response, success: success, failure: failure)
        }
    }
    
    private static func handleModifyPost(response: DataResponse<Any>, success: @escaping () -> (), failure: @escaping (Error) -> ()) {
        if response.result.isFailure {
            failure(response.error!)
            return
        }
        success()
    }
}
