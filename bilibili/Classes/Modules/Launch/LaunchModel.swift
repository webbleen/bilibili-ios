//
//  LaunchModel.swift
//  bilibili
//
//  Created by IB投信 on 3/2/20.
//  Copyright © 2020 webbleen. All rights reserved.
//

import UIKit

struct LaunchModel: Decodable {
    var startPages: String?
    var data: String?
    
    init() {}
    
    enum CodingKeys: String, CodingKey {
          case startPages = "startPages"
          case data = "data"
    }
    
    static func fromJSON(_ dictionary: [String: Any]?) -> LaunchModel? {
      if let json = dictionary {
        var cm = LaunchModel()
        cm.startPages = json["startPages"] as? String
        cm.data = json["data"] as? String
        return cm
      }
      return nil
    }
}
