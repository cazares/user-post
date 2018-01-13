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
}

class APIClient: SessionManager {
    static let baseUrl = "https://mobile-code-test.ifactornotifi.com/json"
    static let usersUrl = "users"

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
}
