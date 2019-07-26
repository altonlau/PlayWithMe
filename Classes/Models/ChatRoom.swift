//
//  ChatRoom.swift
//  PlayWithMe
//
//  Created by Alton Lau on 2019-07-25.
//  Copyright © 2019 Yelp Inc. All rights reserved.
//

import SendBirdSDK

typealias ChatRoom = SBDOpenChannel

extension ChatRoom {
  
  func getParticipants(_ completion: @escaping ((_ users: [User]) -> Void)) {
    guard let query = createParticipantListQuery() else {
      completion([])
      return
    }
    
    DispatchQueue.global().async {
      query.loadNextPage(completionHandler: { (participants, error) in
        DispatchQueue.main.async {
          if let error = error {
            print(error.localizedDescription)
            completion([])
          }
          
          completion(participants ?? [])
        }
      })
    }
  }
  
  func join() {
    guard let user = SettingsManager.currentUser else {
      return
    }
    enter { error in
      if let error = error {
        print(error.localizedDescription)
        return
      }
      user.addParticipatingChannel(with: self)
    }
  }
  
  func leave() {
    guard let user = SettingsManager.currentUser else {
      return
    }
    exitChannel { error in
      if let error = error {
        print(error.localizedDescription)
        return
      }
      user.removeParticipatingChannel(with: self)
    }
  }
  
}
