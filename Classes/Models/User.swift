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
  
  var chatIds: [Int]
  var latitude: CLLocationDegrees?
  var longitude: CLLocationDegrees?
  var name: String {
    return "\(firstName) \(lastName)"
  }
  var location: CLLocation? {
    guard let latitude = latitude, let longitude = longitude else {
      return nil
    }
    return CLLocation(latitude: latitude, longitude: longitude)
  }
  
  init(json: [String : Any]) {
    guard
      let id = json["user_id"] as? Int,
      let firstName = json["first_name"] as? String,
      let lastName = json["last_name"] as? String,
      let chatIds = json["chat_ids"] as? [Int] else {
        fatalError()
    }
    
    self.id = id
    self.firstName = firstName
    self.lastName = lastName
    self.chatIds = chatIds
  }
  
  func toDict() -> [String : Any] {
    return [
      "user_id": id,
      "first_name": firstName,
      "last_name": lastName,
      "chat_ids": chatIds
    ]
  }
  
}

extension User: CustomStringConvertible {
  
  var description: String {
    return "\(id): \(name) \(location?.description ?? "")"
  }
  
}
