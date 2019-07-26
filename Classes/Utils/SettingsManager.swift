//
//  SettingsManager.swift
//  PlayWithMe
//
//  Created by Alton Lau on 7/25/19.
//  Copyright © 2019 Yelp Inc. All rights reserved.
//

import Foundation

class SettingsManager {
  
  private static let userKey = "user_key"
  private static let searchRadiusKey = "search_radius"
  
  static var currentUser: User? {
    get {
      return UserDefaults.standard.dictionary(forKey: userKey).flatMap { User(json: $0) }
    }
    set {
      UserDefaults.standard.set(newValue?.toDict(), forKey: userKey)
    }
  }
  
  static var searchRadius: Double {
    get {
      return UserDefaults.standard.double(forKey: searchRadiusKey)
    }
    set {
      UserDefaults.standard.set(newValue, forKey: searchRadiusKey)
    }
  }
  
}
