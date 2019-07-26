//
//  SendBirdManager.swift
//  PlayWithMe
//
//  Created by Alton Lau on 2019-07-25.
//  Copyright © 2019 Yelp Inc. All rights reserved.
//

import Foundation
import SendBirdSDK

class SendBirdManager {

  static let shared: SendBirdManager = SendBirdManager()

  var isLoggedIn: Bool {
    return SBDMain.getCurrentUser() != nil
  }

  var currentUser: User {
    guard let user = SBDMain.getCurrentUser() else {
      fatalError()
    }
    return user
  }

  func createChatRoom(_ name: String, completion: @escaping ((_ chatRoom: ChatRoom?) -> Void)) {
    let params = SBDGroupChannelParams()
    params.isPublic = true
    params.isEphemeral = false
    params.isDistinct = false
    params.addUserIds([currentUser.userId])
    params.operatorUserIds = [currentUser.userId]
    params.name = name

    SBDGroupChannel.createChannel(with: params) { (channel, error) in
      if let error = error {
        print(error.localizedDescription)
        completion(nil)
      } else {
        completion(channel)
      }
    }
  }

  func getAllChatRooms(_ completion: @escaping ((_ chatRooms: [ChatRoom]) -> Void)) {
    guard let query = ChatRoom.createPublicGroupChannelListQuery() else {
      completion([])
      return
    }
    query.includeEmptyChannel = true
    query.publicMembershipFilter = .all

    DispatchQueue.global().async {
      query.loadNextPage(completionHandler: { (groupChannels, error) in
        DispatchQueue.main.async {
          if let error = error {
            print(error.localizedDescription)
          }
          completion(groupChannels ?? [])
        }
      })
    }
  }

  func getJoinedChatRooms(_ completion: @escaping ((_ chatRooms: [ChatRoom]) -> Void)) {
    guard let query = ChatRoom.createMyGroupChannelListQuery() else {
      completion([])
      return
    }

    DispatchQueue.global().async {
      query.loadNextPage(completionHandler: { (groupChannels, error) in
        DispatchQueue.main.async {
          if let error = error {
            print(error.localizedDescription)
          }
          completion(groupChannels ?? [])
        }
      })
    }
  }

  func getAllMessages(for chatRoom: ChatRoom, completion: @escaping ((_ messages: [Message]) -> Void)) {
    guard let query = chatRoom.createPreviousMessageListQuery() else {
      completion([])
      return
    }

    DispatchQueue.global().async {
      query.loadPreviousMessages(withLimit: 30, reverse: false, completionHandler: { (messages, error) in
        DispatchQueue.main.async {
          if let error = error {
            print(error.localizedDescription)
            completion([])
          } else {
            completion(messages?.map { Message(sbdMessage: $0, messageId: "\($0.messageId)") } ?? [])
          }
        }
      })
    }
  }

}
