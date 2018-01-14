//
//  Geographic.swift
//  UserPost
//
//  Created by Miguel Cazares on 1/12/18.
//  Copyright © 2018 Miguel Cazares. All rights reserved.
//

import UIKit

struct Geographic: Codable {
    let latitude: Double
    let longitude: Double
}

extension Geographic {
    enum GeographicKeys: String, CodingKey {
        case latitude = "lat"
        case longitude = "lng"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: GeographicKeys.self)
        var latitude = 0.0
        var longitude = 0.0
        
        do {
            latitude = (try container.decode(String.self, forKey: .latitude) as NSString).doubleValue
            longitude = (try container.decode(String.self, forKey: .longitude) as NSString).doubleValue
        } catch (let error) {
            print(error)
        }
        self.init(latitude: latitude, longitude: longitude)
    }
    
    var description: String {
        return """
            \tLatitude: \(latitude)
            \tLongitude: \(longitude)
        """
    }
}
