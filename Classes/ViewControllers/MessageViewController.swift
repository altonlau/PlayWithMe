//
//  MessageViewController.swift
//  PlayWithMe
//
//  Created by Stephen Lee on 7/25/19.
//  Copyright © 2019 Yelp Inc. All rights reserved.
//

import InputBarAccessoryView
import MessageKit
import UIKit

class MessageViewController: MessagesViewController {
  
  var messages: [Message] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    messagesCollectionView.messagesDataSource = self
    messagesCollectionView.messagesDisplayDelegate = self
    messagesCollectionView.messagesLayoutDelegate = self
    messageInputBar.delegate = self
    
    scrollsToBottomOnKeyboardBeginsEditing = true // default false
    maintainPositionOnKeyboardFrameChanged = true // default false
  }
  
}


// MARK: - MessageInputBarDelegate

extension MessageViewController: MessageInputBarDelegate {
  
  func inputBar(_ inputBar: InputBarAccessoryView, didPressSendButtonWith text: String) {
    //    let newMessage = Message(
    //      member: member,
    //      text: text,
    //      messageId: UUID().uuidString)
    //
    //    messages.append(newMessage)
    inputBar.inputTextView.text = ""
    messagesCollectionView.reloadData()
    messagesCollectionView.scrollToBottom(animated: true)
  }
  
}


// MARK: - MessagesDataSource

extension MessageViewController: MessagesDataSource {
  
  func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
    return messages.count
  }
  
  func currentSender() -> SenderType {
    guard let user = SettingsManager.currentUser else {
      fatalError()
    }
    return user
  }
  
  func messageForItem(at indexPath: IndexPath,
                      in messagesCollectionView: MessagesCollectionView) -> MessageType {
    return messages[indexPath.section]
  }
  
  func messageTopLabelHeight(for message: MessageType,
                             at indexPath: IndexPath,
                             in messagesCollectionView: MessagesCollectionView
    ) -> CGFloat {
    return 12
  }
  
  func messageTopLabelAttributedText(for message: MessageType,
                                     at indexPath: IndexPath) -> NSAttributedString? {
    return NSAttributedString(string: message.sender.displayName,
                              attributes: [.font: UIFont.systemFont(ofSize: 12)])
  }
  
}


// MARK: - MessagesDisplayDelegate

extension MessageViewController: MessagesDisplayDelegate {
  
  func configureAvatarView(_ avatarView: AvatarView,
                           for message: MessageType,
                           at indexPath: IndexPath,
                           in messagesCollectionView: MessagesCollectionView) {
    avatarView.backgroundColor = .blue
  }
  
}


// MARK: - MessagesLayoutDelegate

extension MessageViewController: MessagesLayoutDelegate {
  
  func heightForLocation(message: MessageType,
                         at indexPath: IndexPath,
                         with maxWidth: CGFloat,
                         in messagesCollectionView: MessagesCollectionView) -> CGFloat {
    return 0
  }
  
}
