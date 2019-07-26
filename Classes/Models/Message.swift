//
//  Chat.swift
//  PlayWithMe
//
//  Created by Stephen Lee on 7/24/19.
//  Copyright © 2019 Yelp Inc. All rights reserved.
//

import Foundation
import MessageKit
import SendBirdSDK

struct Message: MessageType {
  
  let sbdMessage: SBDUserMessage
  
  var messageId: String
  var kind: MessageKind {
    guard let message = sbdMessage.message else {
      fatalError()
    }
    return .text(message)
  }
  var sender: SenderType {
    guard let sender = sbdMessage.sender else {
      fatalError()
    }
    return sender
  }
  var sentDate: Date {
    return Date(timeIntervalSince1970: TimeInterval(sbdMessage.createdAt) / 1000)
  }
  
}
