//
//  Company.swift
//  UserPost
//
//  Created by Miguel Cazares on 1/12/18.
//  Copyright © 2018 Miguel Cazares. All rights reserved.
//

import UIKit
import Mantle

class Company: MTLModel, MTLJSONSerializing {
    var name = emptyString
    var catchPhrase = emptyString
    var bs = emptyString
    
    static func jsonKeyPathsByPropertyKey() -> [AnyHashable : Any]! {
        return [ "name": "name",
                 "catchPhrase": "catchPhrase",
                 "bs": "bs"]
    }
    
    override func description() -> String! {
        return """
            Name: \(name)
            Catch Phrase: \(catchPhrase)
            Tagline: \(bs)
        """
    }
}
