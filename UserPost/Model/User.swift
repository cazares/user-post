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
    var name = emptyString
    var address = Address()
    
    public static func jsonKeyPathsByPropertyKey() -> [AnyHashable : Any]! {
        return [ "name": "name",
                 "address": "address" ]
    }
    
    public static func addressJSONTransformer() -> ValueTransformer {
        return MTLValueTransformer(block: { (payload) in
            do {
                return try MTLJSONAdapter.model(of: Address.self, fromJSONDictionary: payload as! [AnyHashable: Any], error: ()) as! Address
            } catch { }
            return nil
        })
    }
}
