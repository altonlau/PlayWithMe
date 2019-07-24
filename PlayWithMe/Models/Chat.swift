//
//  User.swift
//  PlayWithMe
//
//  Created by Stephen Lee on 7/24/19.
//  Copyright © 2019 Yelp Inc. All rights reserved.
//
import Foundation
import CoreLocation

struct Chat: CustomStringConvertible {
    var description: String { return "\(id) \(name) \(activityType) \(location)"}

    var id: String
    var activityType: String
    var imageURL: String
    var latitude: CLLocationDegrees
    var longitude: CLLocationDegrees
    var location: CLLocation {
        return CLLocation(latitude: latitude, longitude: longitude)
    }
    var name: String
    var chatIds: [String]
    
    
}
