//
//  Company.swift
//  UserPost
//
//  Created by Miguel Cazares on 1/12/18.
//  Copyright © 2018 Miguel Cazares. All rights reserved.
//

import UIKit

struct Company: Decodable {
    let name: String
    let catchPhrase: String
    let tagline: String
    
    enum CompanyKeys: String, CodingKey {
        case name, catchPhrase, tagline = "bs"
    }
}

extension Company {
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
