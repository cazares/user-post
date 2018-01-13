//
//  Address.swift
//  UserPost
//
//  Created by Miguel Cazares on 1/11/18.
//  Copyright © 2018 Miguel Cazares. All rights reserved.
//

import UIKit
import Mantle

class Address: MTLModel, MTLJSONSerializing {
    var street = emptyString
    var suite = emptyString
    var city = emptyString
    var zipcode = emptyString
    var geographic = Geographic()!
    
    public static func jsonKeyPathsByPropertyKey() -> [AnyHashable : Any]! {
        return [ "street": "street",
                 "suite": "suite",
                 "city": "city",
                 "zipcode": "zipcode",
                 "geographic": "geo" ]
    }
    
    public override func description() -> String! {
        return """
            Street: \(street)
            Suite: \(suite)
            City: \(city)
            Zipcode: \(zipcode)
        """
    }
}
