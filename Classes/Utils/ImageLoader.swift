//
//  ImageLoader.swift
//  PlayWithMe
//
//  Created by Alton Lau on 7/25/19.
//  Copyright © 2019 Yelp Inc. All rights reserved.
//

import UIKit

class ImageLoader {
  
  static func load(_ imageUrl: String?, completion: @escaping ((_ image: UIImage?) -> Void)) {
    guard let imageUrl = imageUrl, let url = URL(string: imageUrl) else {
      completion(nil)
      return
    }
    load(url, completion: completion)
  }
  
  static func load(_ imageUrl: URL, completion: @escaping ((_ image: UIImage?) -> Void)) {
    URLSession.shared.dataTask(with: imageUrl) { (data, response, error) in
      if error != nil {
        DispatchQueue.main.async {
          completion(nil)
        }
        return
      }
      
      DispatchQueue.main.async {
        guard let data = data else {
          completion(nil)
          return
        }
        completion(UIImage(data: data))
      }
    }.resume()
  }
  
}
