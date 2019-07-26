//
//  ChatRoom.swift
//  PlayWithMe
//
//  Created by Alton Lau on 2019-07-25.
//  Copyright © 2019 Yelp Inc. All rights reserved.
//

import SendBirdSDK

typealias ChatRoom = SBDGroupChannel

extension ChatRoom {

  func getMembers(_ completion: @escaping ((_ users: [User]) -> Void)) {
    guard let query = createMemberListQuery() else {
      completion([])
      return
    }

    DispatchQueue.global().async {
      query.loadNextPage(completionHandler: { (members, error) in
        DispatchQueue.main.async {
          if let error = error {
            print(error.localizedDescription)
            completion([])
          } else {
            completion(members ?? [])
          }
        }
      })
    }
  }

}
