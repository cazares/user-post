//
//  User.swift
//  UserPost
//
//  Created by Miguel Cazares on 1/11/18.
//  Copyright © 2018 Miguel Cazares. All rights reserved.
//

import UIKit
import Mantle

class User: MTLModel, MTLJSONSerializing {
    var id = 0
    var name = emptyString
    var username = emptyString
    var email = emptyString
    var address = Address()!
    var phone = emptyString
    var website = emptyString
    var company = Company()!
    
    public static func jsonKeyPathsByPropertyKey() -> [AnyHashable : Any]! {
        return [ "name": "name",
                 "username": "username",
                 "email": "email",
                 "address": "address",
                 "id": "id",
                 "phone": "phone",
                 "website": "website",
                 "company": "company" ]
    }
    
    public static func addressJSONTransformer() -> ValueTransformer {
        return MTLValueTransformer(block: { (payload) in
            do {
                return try MTLJSONAdapter.model(of: Address.self, fromJSONDictionary: payload as! [AnyHashable: Any], error: ()) as! Address
            } catch { }
            return nil
        })
    }
    
    public override func description() -> String! {
        return """
        Username: \(username)
        Email: \(email)
        Address
        \t\(address.description)
        Phone: \(phone)
        Website: \(website)
        Company
        \t\(company.description)
        """
    }
}
