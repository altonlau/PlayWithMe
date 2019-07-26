//
//  User.swift
//  PlayWithMe
//
//  Created by Stephen Lee on 7/24/19.
//  Copyright © 2019 Yelp Inc. All rights reserved.
//

import Foundation
import MessageKit

struct User: SenderType {
  
  let id: String
  let firstName: String
  let lastName: String
  
  var chatRoomIds: [Int]
  var displayName: String {
    return "\(firstName) \(lastName)"
  }
  var senderId: String {
    return id
  }
  
  init(json: [String : Any]) {
    guard
      let id = json["user_id"] as? String,
      let firstName = json["first_name"] as? String,
      let lastName = json["last_name"] as? String,
      let chatRoomIds = json["chat_room_ids"] as? [Int] else {
        fatalError()
    }
    
    self.id = id
    self.firstName = firstName
    self.lastName = lastName
    self.chatRoomIds = chatRoomIds
  }
  
  func toDict() -> [String : Any] {
    return [
      "user_id": id,
      "first_name": firstName,
      "last_name": lastName,
      "chat_room_ids": chatRoomIds
    ]
  }
  
}

extension User: CustomStringConvertible {
  
  var description: String {
    return "\(id): \(displayName)"
  }
  
}
