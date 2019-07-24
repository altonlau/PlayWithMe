//
//  ItemRowView.swift
//  PlayWithMe
//
//  Created by Alton Lau on 7/24/19.
//  Copyright © 2019 Yelp Inc. All rights reserved.
//

import UIKit

class ItemRowView: UIView {
  
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var subtitleLabel: UILabel!
  
  init(title: String, subtitle: String? = nil, image: UIImage? = nil) {
    super.init(frame: .zero)
    
    titleLabel.text = title
    subtitleLabel.text = subtitle
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
//  let image: UIImage
//  let title: String
//  let distance: String
//
//  private let joinButton: UIButton
//  private let action: (() -> Void)?
//
//  init(image: UIImage, title: String, distance: String, action: (() -> Void)? = nil) {
//    self.image = image
//    self.title = title
//    self.distance = distance
//    self.action = action
//    self.joinButton = UIButton(frame: .zero)
//
//    super.init(frame: .zero)
//
//    setup()
//  }
//
//  required init?(coder aDecoder: NSCoder) {
//    fatalError("init(coder:) has not been implemented")
//  }
//
//  @objc private func buttonTapped() {
//    action?()
//  }
//
//  private func setup() {
//    joinButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
//
//    setupConstraints()
//  }
//
//  private func setupConstraints() {
//
//  }
  
}
