//
//  ChatItemRowView.swift
//  PlayWithMe
//
//  Created by Alton Lau on 7/24/19.
//  Copyright © 2019 Yelp Inc. All rights reserved.
//

import UIKit

class ChatItemRowView: UIView {
  
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var subtitleLabel: UILabel!
  
  init(title: String, subtitle: String? = nil, image: UIImage? = nil) {
    super.init(frame: .zero)
    
    imageView.image = image
    titleLabel.text = title
    subtitleLabel.text = subtitle
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
}
