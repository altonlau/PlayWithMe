//
//  User.swift
//  PlayWithMe
//
//  Created by Stephen Lee on 7/24/19.
//  Copyright © 2019 Yelp Inc. All rights reserved.
//

import Foundation
import CoreLocation

struct User: CustomStringConvertible {
    var description: String { return "\(firstName) \(lastName)"}
    var firstName: String
    var lastName: String
    var latitude: CLLocationDegrees
    var longitude: CLLocationDegrees
    var location: CLLocation {
        return CLLocation(latitude: latitude, longitude: longitude)
    }
}
