//
//  SettingsManager.swift
//  PlayWithMe
//
//  Created by Alton Lau on 7/25/19.
//  Copyright © 2019 Yelp Inc. All rights reserved.
//

import Foundation
import SendBirdSDK

class SettingsManager {
  
  private static let searchRadiusKey = "search_radius"
  
  static var currentUser: User? {
    get {
      return SBDMain.getCurrentUser()
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
