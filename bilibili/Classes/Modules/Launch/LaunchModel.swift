//
//  LaunchModel.swift
//  bilibili
//
//  Created by IB投信 on 3/2/20.
//  Copyright © 2020 webbleen. All rights reserved.
//

struct LaunchRequestModel {
    var build: String?
    var channel: String?
    var height: String?
    var width: String?
}

struct LaunchResponseModel: Decodable {
    var code: Int?
}
