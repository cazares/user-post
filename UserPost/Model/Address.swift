//
//  Address.swift
//  UserPost
//
//  Created by Miguel Cazares on 1/11/18.
//  Copyright © 2018 Miguel Cazares. All rights reserved.
//

import UIKit
/*import Mantle

class Address: MTLModel, MTLJSONSerializing {
    var street = emptyString
    var suite = emptyString
    var city = emptyString
    var zipcode = emptyString
    var geographic = Geographic()!
    
    static func jsonKeyPathsByPropertyKey() -> [AnyHashable : Any]! {
        return [ "street": "street",
                 "suite": "suite",
                 "city": "city",
                 "zipcode": "zipcode",
                 "geographic": "geo" ]
    }
    
    static func geographicJSONTransformer() -> ValueTransformer {
        return MTLValueTransformer(block: { (payload) in
            do {
                return try MTLJSONAdapter.model(of: Geographic.self, fromJSONDictionary: payload as! [AnyHashable: Any], error: ()) as! Geographic
            } catch { }
            return nil
        })
    }
    
    override func description() -> String! {
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
*/

struct Address: Decodable {
    let street: String
    let suite: String
    let city: String
    let zipcode: String
    let geographic: Geographic
    
    enum AddressKeys: String, CodingKey {
        case street, suite, city, zipcode, geographic = "geo"
    }
    
    init(street: String, suite: String, city: String, zipcode: String, geographic: Geographic) {
        self.street = street
        self.suite = suite
        self.city = city
        self.zipcode = zipcode
        self.geographic
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AddressKeys.self)
        
        let street: String = try container.decode(String.self, forKey: .street)
        let suite: String = try container.decode(String.self, forKey: .suite)
        let city: String = try container.decode(String.self, forKey: .city)
        let zipcode: String = try container.decode(String.self, forKey: .zipcode)
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
