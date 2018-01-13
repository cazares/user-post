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
    
    static func jsonKeyPathsByPropertyKey() -> [AnyHashable : Any]! {
        return [ "name": "name",
                 "username": "username",
                 "email": "email",
                 "address": "address",
                 "id": "id",
                 "phone": "phone",
                 "website": "website",
                 "company": "company" ]
    }
    
    static func addressJSONTransformer() -> ValueTransformer {
        return MTLValueTransformer(block: { (payload) in
            do {
                return try MTLJSONAdapter.model(of: Address.self, fromJSONDictionary: payload as! [AnyHashable: Any], error: ()) as! Address
            } catch { }
            return nil
        })
    }
    
    static func companyJSONTransformer() -> ValueTransformer {
        return MTLValueTransformer(block: { (payload) in
            do {
                return try MTLJSONAdapter.model(of: Company.self, fromJSONDictionary: payload as! [AnyHashable: Any], error: ()) as! Company
            } catch { }
            return nil
        })
    }
    
    override func description() -> String! {
        return """
        Username: \(username)
        Email: \(email)
        Address
        \(address.description)
        Phone: \(phone)
        Website: \(website)
        Company
        \(company.description)
        """
    }
}
