//
//  Company.swift
//  UserPost
//
//  Created by Miguel Cazares on 1/12/18.
//  Copyright © 2018 Miguel Cazares. All rights reserved.
//

import UIKit
/*import Mantle

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
}*/

struct Company: Decodable {
    let name: String
    let catchPhrase: String
    let tagline: String
    
    enum CompanyKeys: String, CodingKey {
        case name, catchPhrase, tagline = "bs"
    }
    
    init(name: String, catchPhrase: String, tagline: String) {
        self.name = name
        self.catchPhrase = catchPhrase
        self.tagline = tagline
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CompanyKeys.self)
        
        let name: String = try container.decode(String.self, forKey: .name)
        let catchPhrase: String = try container.decode(String.self, forKey: .catchPhrase)
        let tagline: String = try container.decode(String.self, forKey: .tagline)
        
        self.init(name: name, catchPhrase: catchPhrase, tagline: tagline)
    }
    
    var description: String {
        return """
            Name: \(name)
            Catch Phrase: \(catchPhrase)
            Tagline: \(tagline)
        """
    }
}
