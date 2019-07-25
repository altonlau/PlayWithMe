//
//  SearchItemRowView.swift
//  PlayWithMe
//
//  Created by Alton Lau on 7/25/19.
//  Copyright © 2019 Yelp Inc. All rights reserved.
//

import UIKit

class SearchItemRowView: ItemRowView {
  
  @IBOutlet weak var distanceLabel: UILabel!
  
  private var joinAction: (() -> Void)? = nil
  
  func setJoinedTap(_ action: (() -> Void)?) {
    joinAction = action
  }
  
  @IBAction func joinButtonTapped(_ sender: Any) {
    joinAction?()
  }
  
}
