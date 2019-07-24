//
//  Group.swift
//  PlayWithMe
//
//  Created by Stephen Lee on 7/24/19.
//  Copyright © 2019 Yelp Inc. All rights reserved.
//

import Foundation
import CoreLocation

struct Chat: CustomStringConvertible {
    var description: String { return "\(id) \(name) \(location)"}

    var id: String
    var messages: [Message]
    var name: String
    var latitude: CLLocationDegrees
    var longitude: CLLocationDegrees
    var location: CLLocation {
        return CLLocation(latitude: latitude, longitude: longitude)
    }
}
