//
//  RoundedButton.swift
//  PlayWithMe
//
//  Created by Alton Lau on 7/26/19.
//  Copyright © 2019 Yelp Inc. All rights reserved.
//

import UIKit

@IBDesignable
class RoundedButton: UIButton {
  
  @IBInspectable var cornerRadius: CGFloat = 4.0
  
  override func draw(_ rect: CGRect) {
    super.draw(rect)
    layer.cornerRadius = cornerRadius
    layer.masksToBounds = true
  }
  
}
