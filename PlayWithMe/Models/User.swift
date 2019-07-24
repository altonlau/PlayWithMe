//
//  Group.swift
//  PlayWithMe
//
//  Created by Stephen Lee on 7/24/19.
//  Copyright © 2019 Yelp Inc. All rights reserved.
//

import Foundation
import CoreLocation

struct User: CustomStringConvertible {
    var description: String { return "\(id) \(name) \(location)"}

    var id: String
    var chatIds: [String]
    var firstName: String
    var lastName: String
    var name: String {
        return "\(firstName) \(lastName)"
    }
    var longitude: CLLocationDegrees
    var latitude: CLLocationDegrees
    var location: CLLocation {
        return CLLocation(latitude: latitude, longitude: longitude)
    }
    
}
