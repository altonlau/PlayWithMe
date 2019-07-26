//
//  PubNub+Ext.swift
//  PlayWithMe
//
//  Created by Stephen Lee on 7/25/19.
//  Copyright © 2019 Yelp Inc. All rights reserved.
//

import Foundation
import PubNub

//extension PubNub {
//    static func configure(with userId: String? = User.defaultValue.uuid, using bundle: Bundle = Bundle.main) -> PubNub {
//        // Read Pub/Sub Keys from Info.plist
//        let (pubKey, subKey) = bundle.pubSubKeys(for: "PubNub")
//        
//        let config = PNConfiguration(publishKey: pubKey, subscribeKey: subKey)
//        if let uuid = userId {
//            NSLog("Configuring PubNub with \(uuid)")
//            config.uuid = uuid
//        }
//        
//        // Gets rid of deprecation warning
//        config.stripMobilePayload = false
//        
//        return PubNub.clientWithConfiguration(config)
//    }
//}
