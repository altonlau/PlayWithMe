//
//  SearchViewController.swift
//  PlayWithMe
//
//  Created by Alton Lau on 7/25/19.
//  Copyright © 2019 Yelp Inc. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
  
  @IBOutlet weak var joinedView: UIView!
  @IBOutlet weak var searchBar: UISearchBar!
  @IBOutlet weak var tableView: UITableView!

  private let reuseIdentifier = "SearchCellIdentifier"
  private var chatRooms: [ChatRoom] = []
  private var filteredChatRooms: [ChatRoom] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    joinedView.alpha = 0.0
    joinedView.isHidden = true
    joinedView.layer.cornerRadius = 4.0
    joinedView.layer.borderColor = PWME_GREEN.cgColor
    joinedView.layer.borderWidth = 2.0
    joinedView.layer.masksToBounds = true
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)

    refresh()
  }

  @IBAction func viewTapped(_ sender: UITapGestureRecognizer) {
    let location = sender.location(in: view)
    if searchBar.isFirstResponder && !searchBar.frame.contains(location) {
      searchBar.resignFirstResponder()
    }
  }
  
  private func animateJoined() {
    joinedView.isHidden = false
    UIView.animate(withDuration: 0.2, animations: { [weak self] in
      self?.joinedView.alpha = 1.0
    }) { _ in
      UIView.animate(withDuration: 1.0, delay: 1.0, options: .curveEaseInOut, animations: { [weak self] in
        self?.joinedView.alpha = 0.0
      }, completion: { [weak self] _ in
        self?.joinedView.isHidden = true
      })
    }
  }

  private func refresh() {
    if searchBar.isFirstResponder {
      searchBar.resignFirstResponder()
    }
    searchBar.text = nil

    SendBirdManager.shared.getNonJoinedChatRooms() { [weak self] chatRooms in
      self?.chatRooms = chatRooms
      self?.filteredChatRooms = chatRooms
      self?.tableView.reloadData()
    }
  }

}

extension SearchViewController: UISearchBarDelegate {
  
  func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    filteredChatRooms = searchText.isEmpty ? chatRooms : chatRooms.filter { $0.name.contains(searchText) }
    tableView.reloadData()
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
      searchItemRowView.setJoinedTap { [weak self] in
        chatRoom.join()
        self?.animateJoined()
        self?.refresh()
      }
      ImageLoader.load(chatRoom.coverUrl) { searchItemRowView.imageView.image = $0 }
    }

    return cell
  }

}

extension SearchViewController: UITableViewDelegate {

  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 44
  }

}
