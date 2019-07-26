//
//  OnboardingViewController.swift
//  PlayWithMe
//
//  Created by Alton Lau on 2019-07-25.
//  Copyright © 2019 Yelp Inc. All rights reserved.
//

import SendBirdSDK
import UIKit

class OnboardingViewController: UIViewController {
  
  @IBOutlet weak var nameTextField: UITextField!
  
  @IBAction func saveButtonPressed(_ sender: UIButton) {
    guard let name = nameTextField.text else {
      return
    }
    SBDMain.connect(withUserId: name) { [weak self] (user, error) in
      if let error = error {
        print(error.localizedDescription)
        fatalError()
      }
      if SettingsManager.currentUser == nil {
        fatalError()
      }
      self?.dismiss(animated: true, completion: nil)
    }
  }
  
}
