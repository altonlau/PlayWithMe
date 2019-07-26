//
//  SearchViewController.swift
//  PlayWithMe
//
//  Created by Alton Lau on 7/25/19.
//  Copyright © 2019 Yelp Inc. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
  
  @IBOutlet weak var searchBar: UISearchBar!
  @IBOutlet weak var tableView: UITableView!
  
  private let reuseIdentifier = "SearchCellIdentifier"
  private var chatRooms: [ChatRoom] = []
  private var filteredChatRooms: [ChatRoom] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupData()
    tableView.reloadData()
  }
  
  @IBAction func viewTapped(_ sender: UITapGestureRecognizer) {
    let location = sender.location(in: view)
    if searchBar.isFirstResponder && !searchBar.frame.contains(location) {
      searchBar.resignFirstResponder()
    }
  }
  
  private func setupData() {
//    chats = MockLoader.loadChats()
    filteredChatRooms = chatRooms
  }
  
}

extension SearchViewController: UITableViewDataSource {
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return filteredChatRooms.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
    
    if let searchItemRowView = tableView.itemRowView(for: cell) as? SearchItemRowView {
      let chatRoom = filteredChatRooms[indexPath.row]
      searchItemRowView.titleLabel.text = chatRoom.name
      ImageLoader.load(chatRoom.coverUrl) { searchItemRowView.imageView.image = $0 }
    }
    
    return cell
  }
  
}

extension SearchViewController: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 44
  }
  
  func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
    if searchBar.isFirstResponder {
      searchBar.resignFirstResponder()
    }
  }
  
}

extension SearchViewController: UISearchBarDelegate {
  
  func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    filteredChatRooms = searchText.isEmpty ? chatRooms : chatRooms.filter { $0.name.contains(searchText) }
    tableView.reloadData()
  }
  
}
