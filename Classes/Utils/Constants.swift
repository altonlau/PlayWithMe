//
//  Constants.swift
//  PlayWithMe
//
//  Created by Alton Lau on 2019-07-25.
//  Copyright © 2019 Yelp Inc. All rights reserved.
//

// MARK: - SendBird Constants

let SENDBIRD_APP_ID: [UInt8] = [113, 64, 70, 116, 33, 40, 35, 84, 76, 71, 84, 118, 102, 98, 86, 40, 39, 37, 89, 3, 69, 72, 125, 72, 84, 32, 81, 86, 76, 81, 124, 103, 121, 39, 95, 35]
let SENDBIRD_API_TOKEN: [UInt8] = [121, 67, 20, 115, 4, 88, 86, 6, 4, 69, 6, 122, 49, 118, 84, 12, 93, 84, 18, 34, 71, 69, 33, 1, 92, 3, 81, 85, 17, 3, 126, 55, 122, 1, 9, 80, 2, 71, 121, 67]
let SENDBIRD_API_ENDPOINT: String = "https://api-\(Obfuscator().reveal(key: SENDBIRD_APP_ID)).sendbird.com"
