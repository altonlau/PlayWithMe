//
//  Chat.swift
//  PlayWithMe
//
//  Created by Stephen Lee on 7/24/19.
//  Copyright © 2019 Yelp Inc. All rights reserved.
//

import Foundation

struct Message: CustomStringConvertible {
  var description: String { return "\(id) \(userId) \(text)"}
  
  var id: String
  var text: String
  var userId: String
  var firstName: String
  var lastName: String
}
