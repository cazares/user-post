//
//  APIClient.swift
//  UserPost
//
//  Created by Miguel Cazares on 1/13/18.
//  Copyright © 2018 Miguel Cazares. All rights reserved.
//

import UIKit
import Alamofire

class APIClient: SessionManager {
    static let baseUrl = "https://mobile-code-test.ifactornotifi.com/json"
    static let usersUrl = "users"

    static func getUsers(success: @escaping ([User]) -> (), failure: @escaping (NSError) -> ()) {
        Alamofire.request("\(baseUrl)/\(usersUrl)")
        .responseJSON { response in
            if response.result.isFailure {
                failure(error)
                return
            }
            
            do {
                let users = try JSONDecoder().decode([User].self, from: response.data!)
                success(users)
            } catch {
                print("error parsing users from server")
                failure(NSError())
            }
        }
    }
}
