//
//  CacheModel.swift
//  THSwift
//
//  Created by webbleen on 2019/11/24.
//  Copyright © 2019 webbleen. All rights reserved.
//

import Foundation

struct CacheModel: Decodable {
    var origin: String?
    var url: String?
    
    init() {}
    
    enum CodingKeys: String, CodingKey {
          case origin = "origin"
          case url = "url"
    }
    
    static func fromJSON(_ dictionary: [String: Any]?) -> CacheModel? {
      if let json = dictionary {
        var cm = CacheModel()
        cm.origin = json["origin"] as? String
        cm.url = json["url"] as? String
        return cm
      }
      return nil
    }
}
