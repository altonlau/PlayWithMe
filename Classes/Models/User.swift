//
//  User.swift
//  PlayWithMe
//
//  Created by Stephen Lee on 7/24/19.
//  Copyright © 2019 Yelp Inc. All rights reserved.
//

import Foundation
import CoreLocation

struct User {
  
  let id: Int
  let firstName: String
  let lastName: String
  let latitude: CLLocationDegrees
  let longitude: CLLocationDegrees
  
  var chatIds: [Int]
  var name: String {
    return "\(firstName) \(lastName)"
  }
  var location: CLLocation {
    return CLLocation(latitude: latitude, longitude: longitude)
  }
  
  init(json: [String : Any]) {
    guard
      let id = json["user_id"] as? Int,
      let firstName = json["first_name"] as? String,
      let lastName = json["last_name"] as? String,
      let latitude = json["latitude"] as? Double,
      let longitude = json["longitude"] as? Double,
      let chatIds = json["chat_ids"] as? [Int] else {
        fatalError()
    }
    
    self.id = id
    self.firstName = firstName
    self.lastName = lastName
    self.latitude = CLLocationDegrees(floatLiteral: latitude)
    self.longitude = CLLocationDegrees(floatLiteral: longitude)
    self.chatIds = chatIds
  }
  
}

extension User: CustomStringConvertible {
  
  var description: String {
    return "\(id): \(name) \(location)"
  }
  
}
