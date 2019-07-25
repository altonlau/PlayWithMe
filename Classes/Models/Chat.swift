//
//  User.swift
//  PlayWithMe
//
//  Created by Stephen Lee on 7/24/19.
//  Copyright © 2019 Yelp Inc. All rights reserved.
//

import CoreLocation
import UIKit

struct Chat {
  
  let id: Int
  let name: String
  let latitude: CLLocationDegrees
  let longitude: CLLocationDegrees
  let activityType: String
  let imageUrl: String
  
  var messageIds: [Int]
  var location: CLLocation {
    return CLLocation(latitude: latitude, longitude: longitude)
  }
  
  init(json: [String : Any]) {
    guard
      let id = json["chat_id"] as? Int,
      let name = json["name"] as? String,
      let latitude = json["latitude"] as? Double,
      let longitude = json["longitude"] as? Double,
      let activityType = json["activity_type"] as? String,
      let imageUrl = json["image_url"] as? String,
      let messageIds = json["messages"] as? [Int] else {
        fatalError()
    }
    
    self.id = id
    self.name = name
    self.latitude = CLLocationDegrees(floatLiteral: latitude)
    self.longitude = CLLocationDegrees(floatLiteral: longitude)
    self.activityType = activityType
    self.imageUrl = imageUrl
    self.messageIds = messageIds
  }
  
}

extension Chat: CustomStringConvertible {
  
  var description: String {
    return "\(id): \(name) \(activityType) \(location)"
  }
  
}
