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
    let baseUrl = "https://mobile-code-test.ifactornotifi.com/json"
    let usersUrl = "users"

    func getUsers(success: ([User]) -> (), failure: (NSError) -> ()) {
        Alamofire.request("\(baseUrl)/\(usersUrl)", method: .get, parameters: nil, encoding: .utf8, headers: nil)
        .responseJSON { response in
            switch response.result{
                
            case .Success(let data) :
                let json = JSON(data)
                let users = try JSONDecoder().decode([User].self, from: json)
                success(users)
                
            case .Failure(let error):
                print("Get users error: \(error)" )
                failure(error)
            }
        }
    }
}
