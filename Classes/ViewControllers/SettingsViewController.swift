//
//  SettingsViewController.swift
//  PlayWithMe
//
//  Created by Stephen Lee on 7/24/19.
//  Copyright © 2019 Yelp Inc. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
  
  @IBOutlet weak var nameTextField: UITextField!
  @IBOutlet weak var sportsTextField: UITextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    nameTextField.text = SettingsManager.currentUser?.displayName
  }
  
  @IBAction func radiusSliderChanged(_ sender: UISlider) {
    SettingsManager.searchRadius = Double(sender.value)
  }
  
}
