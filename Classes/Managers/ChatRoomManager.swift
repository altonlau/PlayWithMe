//
//  ChatRoomManager.swift
//  PlayWithMe
//
//  Created by Alton Lau on 2019-07-25.
//  Copyright © 2019 Yelp Inc. All rights reserved.
//

import Foundation
import SendBirdSDK

class ChatRoomManager {
  
  static let shared: ChatRoomManager = ChatRoomManager()
  
  func getAll(_ completion: @escaping ((_ chatRooms: [ChatRoom]) -> Void)) {
    guard let query = ChatRoom.createOpenChannelListQuery() else {
      completion([])
      return
    }
    
    DispatchQueue.global().async {
      query.loadNextPage(completionHandler: { (openChannels, error) in
        DispatchQueue.main.async {
          if let error = error {
            print(error.localizedDescription)
            completion([])
          }
          
          completion(openChannels ?? [])
        }
      })
    }
  }
  
}
