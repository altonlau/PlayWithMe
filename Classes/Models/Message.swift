//
//  Chat.swift
//  PlayWithMe
//
//  Created by Stephen Lee on 7/24/19.
//  Copyright © 2019 Yelp Inc. All rights reserved.
//

import Foundation
import MessageKit

struct Message: MessageType {
  
  let messageId: String
  let sender: SenderType
  let text: String
  
  var kind: MessageKind {
    return .text(text)
  }
  var sentDate: Date {
    return Date()
  }
  
}
