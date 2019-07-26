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
  
  static let participatingMetaKey = "user_participating"
  
  public var senderId: String {
    return userId
  }
  
  public var displayName: String {
    return nickname ?? userId
  }
  
}

extension User {
  
  func addParticipatingChannel(with channel: ChatRoom) {
    var participatingChannels = metaData?[User.participatingMetaKey]?.components(separatedBy: ",") ?? []
    participatingChannels.append(channel.channelUrl)
    updateMetaData([User.participatingMetaKey: participatingChannels.joined(separator: ",")], completionHandler: nil)
  }
  
  func removeParticipatingChannel(with channel: ChatRoom) {
    var participatingChannels = metaData?[User.participatingMetaKey]?.components(separatedBy: ",") ?? []
    guard let index = participatingChannels.firstIndex(of: channel.channelUrl) else {
      return
    }
    participatingChannels.remove(at: index)
    updateMetaData([User.participatingMetaKey: participatingChannels.joined(separator: ",")], completionHandler: nil)
  }
  
}
