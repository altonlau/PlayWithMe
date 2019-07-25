//
//  Chat.swift
//  PlayWithMe
//
//  Created by Stephen Lee on 7/24/19.
//  Copyright © 2019 Yelp Inc. All rights reserved.
//

import Foundation
import UIKit
import MessageKit

//struct Message: CustomStringConvertible {
//    var description: String { return "\(id) \(userId) \(text)"}
//
//    let id: String
//    let text: String
//    let userId: String
//    let firstName: String
//    let lastName: String
//
//}
//
//extension Message: MessageType {
//    var sender: SenderType {
//        return Sender(id: self.firstName, displayName: self.lastName)
//    }
//
//    var messageId: String {
//        return
//    }
//
//
//    var sentDate: Date {
//        return Date()
//    }
//
//    var kind: MessageKind {
//        return .text(text)
//    }
//}

struct Member {
    let name: String
    let color: UIColor
}

struct Message {
    let member: Member
    let text: String
    let messageId: String
}

extension Message: MessageType {
    var sender: SenderType {
        return Sender(id: member.name, displayName: member.name)
    }
    
    var sentDate: Date {
        return Date()
    }
    
    var kind: MessageKind {
        return .text(text)
    }
}
