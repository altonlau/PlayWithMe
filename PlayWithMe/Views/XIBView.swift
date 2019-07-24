//
//  XIBView.swift
//  PlayWithMe
//
//  Created by Alton Lau on 7/24/19.
//  Copyright © 2019 Yelp Inc. All rights reserved.
//

import UIKit

@IBDesignable
class XIBView: UIView {
  
  @IBInspectable var nibName: String?
  
  var contentView: UIView?
  
  override func awakeFromNib() {
    super.awakeFromNib()
    setup()
  }
  
  override func prepareForInterfaceBuilder() {
    super.prepareForInterfaceBuilder()
    setup()
    contentView?.prepareForInterfaceBuilder()
  }
  
  private func setup() {
    guard let nibName = nibName else {
      return
    }
    let bundle = Bundle(for: type(of: self))
    let nib = UINib(nibName: nibName, bundle: bundle)
    
    guard let view = nib.instantiate( withOwner: self, options: nil).first as? UIView else {
      return
    }
    view.frame = bounds
    view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    addSubview(view)
    
    contentView = view
  }
  
}
