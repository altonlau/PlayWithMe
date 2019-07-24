//
//  AppDelegate.swift
//  PlayWithMe
//
//  Created by Alton Lau on 7/24/19.
//  Copyright © 2019 Yelp Inc. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    let navigationController = UINavigationController(rootViewController: MainViewController())
    
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.rootViewController = navigationController
    window?.makeKeyAndVisible()
    
    return true
  }

}

