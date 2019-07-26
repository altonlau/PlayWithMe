//
//  MessageViewController.swift
//  PlayWithMe
//
//  Created by Stephen Lee on 7/25/19.
//  Copyright © 2019 Yelp Inc. All rights reserved.
//

import UIKit
import MessageKit
import InputBarAccessoryView
import PubNub

var messages: [Message] = [Message(
    member: Member(name: "bluemoon", color: .blue),
    text: "text",
    messageId: "123")]
var member: Member!

class MessageViewController: MessagesViewController, PNObjectEventListener {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        member = Member(name: "bluemoon", color: .blue)
        configureMessageCollectionView()
        configureMessageInputBar()
        messagesCollectionView.messagesDisplayDelegate = self
        messagesCollectionView.messagesLayoutDelegate = self
        
        let client: PubNub?
        let config = PNConfiguration(
            publishKey: "pub-c-97d4b487-fd19-4f87-88cd-96d33d9e9978",
            subscribeKey: "sub-c-ca14338c-af44-11e9-a577-e6e01a51e1d3"
        )
        
        config.stripMobilePayload = false
        client = PubNub.clientWithConfiguration(config)
        client?.addListener(self)
        
        client?.timeWithCompletion({(result,status) -> Void in
            if status == nil {
                client?.publish("Hello From Swift SDK", toChannel: "pubnub_onboarding_channel") {
                    (status) in
                    print("I published with: \(status.debugDescription)")
                }
            }
        })
    }

    func configureMessageCollectionView() {
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messageCellDelegate = self
        scrollsToBottomOnKeyboardBeginsEditing = true // default false
        maintainPositionOnKeyboardFrameChanged = true // default false
    }
    
    func configureMessageInputBar() {
        messageInputBar.delegate = self
//        messageInputBar.inputTextView.tintColor = .primaryColor
//        messageInputBar.sendButton.setTitleColor(.primaryColor, for: .normal)
//        messageInputBar.sendButton.setTitleColor(
//            UIColor.primaryColor.withAlphaComponent(0.3),
//            for: .highlighted
//        )
    }
}
extension MessageViewController: MessagesDataSource {
    func numberOfSections(
        in messagesCollectionView: MessagesCollectionView) -> Int {
        return messages.count
    }
    
    func currentSender() -> SenderType {
        return Sender(id: member.name, displayName: member.name)
    }
    
    func messageForItem(
        at indexPath: IndexPath,
        in messagesCollectionView: MessagesCollectionView) -> MessageType {
        
        return messages[indexPath.section]
    }
    
    func messageTopLabelHeight(
        for message: MessageType,
        at indexPath: IndexPath,
        in messagesCollectionView: MessagesCollectionView) -> CGFloat {
        
        return 12
    }
    
    func messageTopLabelAttributedText(
        for message: MessageType,
        at indexPath: IndexPath) -> NSAttributedString? {
        
        return NSAttributedString(
            string: message.sender.displayName,
            attributes: [.font: UIFont.systemFont(ofSize: 12)])
    }
}


extension MessageViewController: MessagesLayoutDelegate {
    func heightForLocation(message: MessageType,
                           at indexPath: IndexPath,
                           with maxWidth: CGFloat,
                           in messagesCollectionView: MessagesCollectionView) -> CGFloat {
        
        return 0
    }
}

extension MessageViewController: MessagesDisplayDelegate {
    func configureAvatarView(
        _ avatarView: AvatarView,
        for message: MessageType,
        at indexPath: IndexPath,
        in messagesCollectionView: MessagesCollectionView) {
        
        _ = messages[indexPath.section]
        let color = #colorLiteral(red: 0.1283891797, green: 0.6054974198, blue: 1, alpha: 1)
        avatarView.backgroundColor = color
    }
}

extension MessageViewController: InputBarAccessoryViewDelegate{
    func inputBar(_ inputBar: InputBarAccessoryView, didPressSendButtonWith text: String) {
        let newMessage = Message(
            member: member,
            text: text,
            messageId: UUID().uuidString)
        
        messages.append(newMessage)
        inputBar.inputTextView.text = ""
        messagesCollectionView.reloadData()
        messagesCollectionView.scrollToBottom(animated: true)
        
    }
}

extension MessageViewController: MessageCellDelegate {
    
    func didTapAvatar(in cell: MessageCollectionViewCell) {
        print("Avatar tapped")
    }
    
    func didTapMessage(in cell: MessageCollectionViewCell) {
        print("Message tapped")
    }
    
    func didTapCellTopLabel(in cell: MessageCollectionViewCell) {
        print("Top cell label tapped")
    }
    
    func didTapCellBottomLabel(in cell: MessageCollectionViewCell) {
        print("Bottom cell label tapped")
    }
    
    func didTapMessageTopLabel(in cell: MessageCollectionViewCell) {
        print("Top message label tapped")
    }
    
    func didTapMessageBottomLabel(in cell: MessageCollectionViewCell) {
        print("Bottom label tapped")
    }
    
   
    
    func didTapAccessoryView(in cell: MessageCollectionViewCell) {
        print("Accessory view tapped")
    }
    
}
