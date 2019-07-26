//
//  MessageViewController.swift
//  PlayWithMe
//
//  Created by Stephen Lee on 7/25/19.
//  Copyright © 2019 Yelp Inc. All rights reserved.
//

import InputBarAccessoryView
import MessageKit
import SendBirdSDK
import UIKit

class MessageViewController: MessagesViewController {

  var chatRoom: ChatRoom? = nil {
    didSet {
      setup()
    }
  }
  var messages: [Message] = []

  override func viewDidLoad() {
    super.viewDidLoad()

    messagesCollectionView.messagesDataSource = self
    messagesCollectionView.messagesDisplayDelegate = self
    messagesCollectionView.messagesLayoutDelegate = self
    messageInputBar.delegate = self
    messageInputBar.sendButton.configure { $0.setTitleColor(PWME_BLUE, for: .normal) }
    scrollsToBottomOnKeyboardBeginsEditing = true // default false
    maintainPositionOnKeyboardFrameChanged = true // default false
  }
  
  @IBAction func closeButtonPressed(_ sender: Any) {
    navigationController?.dismiss(animated: true, completion: nil)
  }
  
  private func setup() {
    SBDMain.removeAllChannelDelegates()
    guard let chatRoom = chatRoom else {
      dismiss(animated: false, completion: nil)
      return
    }
    chatRoom.join()
    SBDMain.add(self, identifier: chatRoom.channelUrl)
    SendBirdManager.shared.getAllMessages(for: chatRoom) { [weak self] messages in
      self?.messages = messages
      self?.messagesCollectionView.reloadData()
      self?.messagesCollectionView.scrollToBottom(animated: true)
    }
    navigationItem.title = chatRoom.name
  }

}


// MARK: - MessageInputBarDelegate

extension MessageViewController: MessageInputBarDelegate {

  func inputBar(_ inputBar: InputBarAccessoryView, didPressSendButtonWith text: String) {
    // Here we can parse for which substrings were autocompleted
    let attributedText = messageInputBar.inputTextView.attributedText!
    let range = NSRange(location: 0, length: attributedText.length)
    attributedText.enumerateAttribute(.autocompleted, in: range, options: []) { (_, range, _) in

      let substring = attributedText.attributedSubstring(from: range)
      let context = substring.attribute(.autocompletedContext, at: 0, effectiveRange: nil)
      print("Autocompleted: `", substring, "` with context: ", context ?? [])
    }

    messageInputBar.inputTextView.text = String()
    messageInputBar.invalidatePlugins()

    // Send button activity animation
    messageInputBar.sendButton.startAnimating()
    messageInputBar.inputTextView.placeholder = "Sending..."

    if text != "" {
      DispatchQueue.global(qos: .default).async {
        // fake send request task
        sleep(1)
        DispatchQueue.main.async { [weak self] in
          self?.messageInputBar.sendButton.stopAnimating()
          self?.messageInputBar.inputTextView.placeholder = "Aa"
          // Store message to the backend and client side
          self?.chatRoom?.sendUserMessage(text) {
            (message, error) in
            if let error = error {
              print(error.localizedDescription)
            } else if let message = message {
              self?.messages.append(Message(sbdMessage: message, messageId: "\(message.messageId)"))
            }
            
            self?.messagesCollectionView.reloadData()
            self?.messagesCollectionView.scrollToBottom(animated: true)
          }
        }
      }
    }
  }

}


// MARK: - MessagesDataSource

extension MessageViewController: MessagesDataSource {

  func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
    return messages.count
  }

  func currentSender() -> SenderType {
    return SendBirdManager.shared.currentUser
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
  
  func backgroundColor(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> UIColor {
    if isFromCurrentSender(message: message) {
      return PWME_BLUE
    }
    return .white
  }

  func configureAvatarView(_ avatarView: AvatarView,
                           for message: MessageType,
                           at indexPath: IndexPath,
                           in messagesCollectionView: MessagesCollectionView) {
    guard let imageUrl = (message.sender as? User)?.profileUrl else {
      return
    }
    ImageLoader.load(imageUrl) { image in
      avatarView.image = image
    }
  }
  
  func messageStyle(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageStyle {
    return .bubbleOutline(isFromCurrentSender(message: message) ? .clear : .lightGray)
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


// MARK: - SBDChannelDelegate

extension MessageViewController: SBDChannelDelegate {

  func channel(_ sender: SBDBaseChannel, didReceive message: SBDBaseMessage) {
    messages.append(Message(sbdMessage: message, messageId: "\(message.messageId)"))
    messagesCollectionView.reloadData()
    messagesCollectionView.scrollToBottom(animated: true)
  }

}
