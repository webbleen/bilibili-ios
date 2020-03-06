//
//  LaunchModel.swift
//  bilibili
//
//  Created by WENBIN.LI on 3/2/20.
//  Copyright © 2020 webbleen. All rights reserved.
//

struct LaunchRequestModel: Encodable {
    var actionKey: String?
    var ad_extra: String?
    var appkey: String?
    var birth: String?
    var build: Int?
    var device: String?
    var mobi_app: String?
    var platform: String?
    var sign: String?
    var statistics: String?
    var ts: String?
    var height: Int?
    var width: Int?
}

struct LaunchResponseModel: Decodable {
    var max_time: Int?
    var min_interval: Int?
    var pull_interval: Int?
    var list: [ListModel]?
    var show: [ShowModel]?
}

struct ListModel: Decodable {
    var id: Int?
    var type: Int?
    var card_type: Int?
    var duration: Int?
    var begin_time: Int?
    var end_time: Int?
    var thumb: String?
    var hash: String?
    var logo_url: String?
    var logo_hash: String?
    var skip: Int?
    var uri: String?
    var uri_title: String?
    var source: Int?
    var ad_cb: String?
    var resource_id: Int?
    var request_id: String?
    var client_ip: String?
    var is_ad: Bool?
    var is_ad_loc: Bool?
    var extra: ExtraModel?
}

struct ShowModel: Decodable {
    var id: Int?
    var stime: Int?
    var etime: Int?
}

struct ExtraModel: Decodable {
    var use_ad_web_v2: Bool?
}
