//
//  MockLoader.swift
//  PlayWithMe
//
//  Created by Alton Lau on 7/25/19.
//  Copyright © 2019 Yelp Inc. All rights reserved.
//

import Foundation

class MockLoader {
  
  private static let chatJson = Bundle.main.path(forResource: "chat_data", ofType: "json")
  private static let userJson = Bundle.main.path(forResource: "user_data", ofType: "json")
  
  static func loadChats() -> [Chat] {
    guard let chats = chatJson.flatMap({ parseJson($0) }) as? [[String : Any]] else {
      return []
    }
    return chats.map { Chat(json: $0) }
  }
  
  static func loadUsers() -> [User] {
    guard let users = userJson.flatMap({ parseJson($0) }) as? [[String : Any]] else {
        return []
    }
    return users.map { User(json: $0) }
  }
  
  private static func parseJson(_ json: String) -> Any? {
    return try? JSONSerialization.jsonObject(with: Data(contentsOf: URL(fileURLWithPath: json), options: .mappedIfSafe), options: .allowFragments)
  }
  
}
