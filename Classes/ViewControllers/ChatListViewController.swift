//
//  ChatListViewController.swift
//  PlayWithMe
//
//  Created by Alton Lau on 7/24/19.
//  Copyright © 2019 Yelp Inc. All rights reserved.
//

import UIKit

class ChatListViewController: UITableViewController {
  
  private let reuseIdentifier = "ChatCellIdentifier"
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 44
  }
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // Temporary until we get data
    return 5
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    // Temporary until we get data
    let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
//    guard let chatRowItemView = itemRowView(for: cell) as? ChatItemRowView else {
//      return cell
//    }

    return cell
  }
  
}
