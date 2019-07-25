//
//  UITableView+ItemRowView.swift
//  PlayWithMe
//
//  Created by Alton Lau on 7/25/19.
//  Copyright © 2019 Yelp Inc. All rights reserved.
//

import UIKit

extension UITableView {
  
  func itemRowView(for cell: UITableViewCell) -> ItemRowView? {
    return (cell.contentView.subviews.first as? XIBView)?.contentView as? ItemRowView
  }
  
}
