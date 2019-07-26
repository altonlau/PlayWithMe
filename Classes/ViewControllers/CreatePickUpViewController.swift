//
//  CreatePickUpViewController.swift
//  PlayWithMe
//
//  Created by Alton Lau on 7/26/19.
//  Copyright © 2019 Yelp Inc. All rights reserved.
//

import UIKit

class CreatePickUpViewController: UIViewController {
  
  @IBOutlet weak var contentView: UIView!
  @IBOutlet weak var overlayView: UIView!
  @IBOutlet weak var nameTextField: UITextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    contentView.layer.cornerRadius = 4.0
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    UIView.animate(withDuration: 0.2) { [weak self] in
      self?.overlayView.alpha = 0.2
    }
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    UIView.animate(withDuration: 0.2, animations: { [weak self] in
      self?.overlayView.alpha = 0.0
    }) { _ in
      super.viewWillDisappear(animated)
    }
  }
  
  @IBAction func createButtonPressed(_ sender: UIButton) {
    guard
      let roomName = nameTextField.text,
      let chatRoomsViewController = (presentingViewController as? MainViewController)?.selectedViewController as? ChatRoomsViewController else {
      return
    }
    SendBirdManager.shared.createChatRoom(roomName) { [weak self] _ in
      UIView.animate(withDuration: 0.2, animations: {
        self?.overlayView.alpha = 0.0
      }, completion: { _ in
        chatRoomsViewController.viewWillAppear(true)
        self?.dismiss(animated: true, completion: nil)
      })
    }
  }

  @IBAction func viewTapped(_ sender: UITapGestureRecognizer) {
    let location = sender.location(in: view)
    if !contentView.frame.contains(location) {
      UIView.animate(withDuration: 0.2, animations: { [weak self] in
        self?.overlayView.alpha = 0.0
      }, completion: { [weak self] _ in
        self?.dismiss(animated: true, completion: nil)
      })
    }
  }
  
}
