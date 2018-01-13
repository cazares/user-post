//
//  Geographic.swift
//  UserPost
//
//  Created by Miguel Cazares on 1/12/18.
//  Copyright © 2018 Miguel Cazares. All rights reserved.
//

import UIKit
/*import Mantle

class Geographic: MTLModel, MTLJSONSerializing {
    var latitude = 0.0
    var longitude = 0.0
    
    static func jsonKeyPathsByPropertyKey() -> [AnyHashable : Any]! {
        return [ "latitude": "lat",
                 "longitude": "lng" ]
    }
    
    override func description() -> String! {
        return """
        \tLatitude: \(latitude)
        \tLongitude: \(longitude)
        """
    }
}*/

struct Geographic: Decodable {
    let latitude: Double
    let longitude: Double
    
    enum GeographicKeys: String, CodingKey {
        case latitude = "lat"
        case longitude = "lng"
    }
    
    init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: GeographicKeys.self)
        
        let latitude: Double = try container.decode(Double.self, forKey: .latitude)
        let longitude: Double = try container.decode(Double.self, forKey: .longitude)
        
        self.init(latitude: latitude, longitude: longitude)
    }
    
    var description: String {
        return """
            \tLatitude: \(latitude)
            \tLongitude: \(longitude)
        """
    }
}
