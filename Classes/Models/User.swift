//
//  User.swift
//  PlayWithMe
//
//  Created by Stephen Lee on 7/24/19.
//  Copyright © 2019 Yelp Inc. All rights reserved.
//

import Foundation
import MessageKit
import SendBirdSDK

typealias User = SBDUser

extension User: SenderType {
  
  public var senderId: String {
    return userId
  }
  
  public var displayName: String {
    return nickname ?? userId
  }
  
}
