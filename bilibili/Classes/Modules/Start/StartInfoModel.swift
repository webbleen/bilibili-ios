//
//  StartInfoModel.swift
//  bilibili
//
//  Created by IB投信 on 3/2/20.
//  Copyright © 2020 webbleen. All rights reserved.
//

import UIKit

struct StartInfoModel: Decodable {
    var startPages: String?
    var data: String?
    
    init() {}
    
    enum CodingKeys: String, CodingKey {
        case msgID = "startPages"
        case data = "data"
    }
    
    static func fromJSON(_ dictionary: [String: Any]?) -> StartInfoModel? {
      if let json = dictionary {
        var cm = StartInfoModel()
        cm.startPages = json["startPages"] as? String
        cm.data = json["data"] as? String
        return cm
      }
      return nil
    }
}
