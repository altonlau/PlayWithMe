//
//  SearchViewController.swift
//  PlayWithMe
//
//  Created by Alton Lau on 7/25/19.
//  Copyright © 2019 Yelp Inc. All rights reserved.
//

import UIKit

class SearchViewController: UITableViewController {
  
  private let reuseIdentifier = "SearchCellIdentifier"
  private var chats: [Chat] = []
  
  override func viewDidLoad() {
    chats = MockLoader.loadChats()
  }
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 44
  }
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return chats.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    // Temporary until we get data
    let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
    
    if let searchItemRowView = itemRowView(for: cell) as? SearchItemRowView {
      let chat = chats[indexPath.row]
      searchItemRowView.titleLabel.text = chat.name
      ImageLoader.load(chat.imageUrl) { searchItemRowView.imageView.image = $0 }
    }
    
    return cell
  }
  
}
