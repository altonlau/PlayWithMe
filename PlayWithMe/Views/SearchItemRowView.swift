//
//  SearchItemRowView.swift
//  PlayWithMe
//
//  Created by Alton Lau on 7/25/19.
//  Copyright © 2019 Yelp Inc. All rights reserved.
//

import UIKit

class SearchItemRowView: UIView {
  
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var distanceLabel: UILabel!
  @IBOutlet weak var titleLabel: UILabel!
  
  private let joinAction: (() -> Void)?
  
  init(title: String, distance: Float, image: UIImage? = nil, didJoin: (() -> Void)? = nil) {
    self.joinAction = didJoin
    
    super.init(frame: .zero)
    
    imageView.image = image
    distanceLabel.text = "\(distance)mi"
    titleLabel.text = title
  }
  
  required init?(coder aDecoder: NSCoder) {
    self.joinAction = nil
    super.init(coder: aDecoder)
  }
  
  @IBAction func joinButtonTapped(_ sender: Any) {
    joinAction?()
  }
  
}
