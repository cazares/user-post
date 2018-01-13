//
//  Geo.swift
//  UserPost
//
//  Created by Miguel Cazares on 1/12/18.
//  Copyright © 2018 Miguel Cazares. All rights reserved.
//

import UIKit
import Mantle

class Geographic: MTLModel, MTLJSONSerializing {
    var latitude = 0.0
    var longitude = 0.0
    
    public static func jsonKeyPathsByPropertyKey() -> [AnyHashable : Any]! {
        return [ "latitude": "lat",
                 "longitude": "lng" ]
    }
}
