//
//  PubNub+ChatProvider.swift
//  PlayWithMe
//
//  Created by Stephen Lee on 7/25/19.
//  Copyright © 2019 Yelp Inc. All rights reserved.
//

import PubNub

//extension PubNub: ChatProvider {
//    func send(_ request: ChatMessageRequest, completion: @escaping (Result<ChatMessageResponse, NSError>) -> Void) {
//        publish(request.message,
//                toChannel: request.roomId,
//                mobilePushPayload: request.parameters.mobilePushPayload,
//                storeInHistory: request.parameters.storeInHistory,
//                compressed: request.parameters.compressed,
//                withMetadata: request.parameters.metadata)
//        { (status) in
//            if let error = status.error {
//                completion(.failure(error))
//            } else {
//                completion(.success(status))
//            }
//        }
//    }
//}
