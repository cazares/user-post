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
    var phone = emptyString
    var website = emptyString
    var company = Company()!
    
    public static func jsonKeyPathsByPropertyKey() -> [AnyHashable : Any]! {
        return [ "street": "street",
                 "suite": "suite",
                 "city": "city",
                 "zipcode": "zipcode",
                 "geographic": "geo",
                 "phone": "phone",
                 "website": "website",
                 "company": "company" ]
    }
    
    public override func description() -> String! {
        return """
            Street: \(street)
            Suite: \(suite)
            City: \(city)
            Zipcode: \(zipcode)
            Geographic Location
            \tlatitude: \(geographic.latitude)
            \tlongitude: \(geographic.longitude)
            Phone: \(phone)
            Website: \(website)
            Company
            \tName: \(company.name)
            \tCatch Phrase: \(company.catchPhrase)
            \tTagline: \(company.bs)
        """
    }
}
