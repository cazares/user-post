//
//  Address.swift
//  UserPost
//
//  Created by Miguel Cazares on 1/11/18.
//  Copyright © 2018 Miguel Cazares. All rights reserved.
//

import UIKit

struct Address: Codable {
    let street: String
    let suite: String
    let city: String
    let zipcode: String
    let geographic: Geographic
    
    enum AddressKeys: String, CodingKey {
        case street, suite, city, zipcode, geographic = "geo"
    }
}

extension Address {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AddressKeys.self)
        
        let street = try container.decode(String.self, forKey: .street)
        let suite = try container.decode(String.self, forKey: .suite)
        let city = try container.decode(String.self, forKey: .city)
        let zipcode = try container.decode(String.self, forKey: .zipcode)
        
        let geographic: Geographic = try container.decode(Geographic.self, forKey: .geographic)
        
        self.init(street: street, suite: suite, city: city, zipcode: zipcode, geographic: geographic)
    }
    
    var description: String {
        return """
        Street: \(street)
        Suite: \(suite)
        City: \(city)
        Zipcode: \(zipcode)
        Geographic Location
        \(geographic.description)
        """
    }
}
