//
//  MainViewController.swift
//  PlayWithMe
//
//  Created by Alton Lau on 2019-07-25.
//  Copyright © 2019 Yelp Inc. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    if SettingsManager.currentUser == nil {
      let storyboard = UIStoryboard(name: MAIN_STORYBOARD, bundle: nil)
      let onboardingController = storyboard.instantiateViewController(withIdentifier: ONBOARDING_STORYBOARD_ID)
      onboardingController.modalPresentationStyle = .fullScreen
      present(onboardingController, animated: true, completion: nil)
    }
  }
  
}
