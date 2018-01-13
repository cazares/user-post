//
//  Geographic.swift
//  UserPost
//
//  Created by Miguel Cazares on 1/12/18.
//  Copyright © 2018 Miguel Cazares. All rights reserved.
//

import UIKit

struct Geographic: Decodable {
    let latitude: String
    let longitude: String
    
    enum GeographicKeys: String, CodingKey {
        case latitude = "lat"
        case longitude = "lng"
    }
    
    init(latitude: String, longitude: String) {
        self.latitude = latitude
        self.longitude = longitude
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: GeographicKeys.self)
        var latitude = emptyString
        var longitude = emptyString
        
        do {
            latitude = try container.decode(String.self, forKey: .latitude)
            longitude = try container.decode(String.self, forKey: .longitude)
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
