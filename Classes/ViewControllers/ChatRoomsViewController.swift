//
//  ChatRoomsViewController.swift
//  PlayWithMe
//
//  Created by Alton Lau on 7/24/19.
//  Copyright © 2019 Yelp Inc. All rights reserved.
//

import UIKit

class ChatRoomsViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  
  private let reuseIdentifier = "ChatCellIdentifier"
  
  private var chatRooms: [ChatRoom] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    refresh()
  }
  
  @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
    // TODO: Create channels
  }
  
  @IBAction func refreshButtonPressed(_ sender: UIBarButtonItem) {
    
  }
  
  private func refresh() {
    ChatRoomManager.shared.getAll(with: SettingsManager.currentUser) { [weak self] chatRooms in
      self?.chatRooms = chatRooms
      self?.tableView.reloadData()
    }
  }
  
}

extension ChatRoomsViewController: UITableViewDataSource {
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // Temporary until we get data
    return chatRooms.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    // Temporary until we get data
    let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
    
    if let chatRowItemView = tableView.itemRowView(for: cell) as? ChatItemRowView {
      let chatRoom = chatRooms[indexPath.row]
      chatRowItemView.titleLabel.text = chatRoom.name
      chatRowItemView.subtitleLabel.text = nil
      chatRoom.getParticipants { users in
        chatRowItemView.subtitleLabel.text = users.map { $0.displayName }.joined(separator: ", ")
      }
      ImageLoader.load(chatRoom.coverUrl) { chatRowItemView.imageView.image = $0 }
    }
    
    return cell
  }
  
}

extension ChatRoomsViewController: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 44
  }
  
}
