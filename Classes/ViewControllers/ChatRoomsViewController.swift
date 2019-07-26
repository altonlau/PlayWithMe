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

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    guard
      let messageViewController = segue.destination as? MessageViewController,
      let selectedIndex = tableView.indexPathForSelectedRow?.row else {
      // TODO: Abort the segue from happening
      return
    }
    messageViewController.chatRoom = chatRooms[selectedIndex]
  }

  @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
    SendBirdManager.shared.createChatRoom("Tennis - Dolores") { chatRoom in
      // TODO: Set MessageViewController.chatRoom
      // TODO: Push to MessageViewController
    }
  }

  @IBAction func refreshButtonPressed(_ sender: UIBarButtonItem) {
    refresh()
  }

  private func refresh() {
    SendBirdManager.shared.getJoinedChatRooms() { [weak self] chatRooms in
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
      chatRoom.getMembers { users in
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
