//
//  HomeRecommendModel.swift
//  bilibili
//
//  Created by WENBIN.LI on 3/6/20.
//  Copyright © 2020 webbleen. All rights reserved.
//

import Foundation

struct HomeRecommendRequestModel: Encodable {
    var actionKey: String?
    var autoplay_card: Int?
    var banner_hash: String?
    var build: Int?
    var column: Int?
    var device: String?
    var flush: Int?
    var fnval: Int?
    var fnver: Int?
    var idx: String?
    var mobi_app: String?
    var nerwork: String?
    var open_event: String?
    var parent_mode: Int?
    var plaform: String?
    var pull: Int?
    var qn: Int?
    var recsys_mode: Int?
    var ts: String?
    var ad_extra: String?
}

struct HomeRecommendResponseModel: Decodable {
    var items: [HomeRecommendItem]?
    var config: HomeRecommendConfig?
}

struct HomeRecommendConfig: Decodable {
    var column: Int?
    var autoplay_card: Int?
    var feed_clean_abtest: Int?
    var home_transfer_test: Int?
    var auto_refresh_time: Int?
}

struct HomeRecommendItem: Decodable {
    var card_type: String?
    var card_goto: String?
    var goto: String?
    var param: String?
    var cover: String?
    var title: String?
    var uri: String?
    var three_point: HomeRecommendItemThreePoint?
    var args: HomeRecommendItemArgs?
    var player_args: HomeRecommendItemPlayerArgs?
    var idx: Int?
    var three_point_v2: [HomeRecommendItemThreePointV2]?
    var cover_left_text_1: String?
    var cover_left_icon_1: Int?
    var cover_left_text_2: String?
    var cover_left_icon_2: Int?
    var cover_right_text: String?
    var desc_button: HomeRecommendItemDescButton?
    var can_play: Int?
}

struct HomeRecommendItemThreePoint: Decodable {
    var dislike_reasons: [HomeRecommendItemThreePointDislikeReasons]?
    var feedbacks: [HomeRecommendItemThreePointFeedbacks]?
    var watch_later: Int?
}

struct HomeRecommendItemThreePointDislikeReasons: Decodable {
    var id: Int?
    var name: String?
}

struct HomeRecommendItemThreePointFeedbacks: Decodable {
    var id: Int?
    var name: String?
}

struct HomeRecommendItemArgs: Decodable {
    var up_id: Int?
    var up_name: String?
    var rid: Int?
    var rname: String?
    var tid: Int?
    var tname: String?
    var aid: Int?
}

struct HomeRecommendItemPlayerArgs: Decodable {
    var aid: Int?
    var cid: Int?
    var type: String?
}

struct HomeRecommendItemThreePointV2: Decodable {
    var title: String?
    var type: String?
    var subtitle: String?
    var reasons: [HomeRecommendItemThreePointV2Reasons]?
    var watch_later: Int?
}

struct HomeRecommendItemThreePointV2Reasons: Decodable {
    var id: Int?
    var name: String?
}

struct HomeRecommendItemDescButton: Decodable {
    var text: String?
    var event: String?
    var type: Int?
    var event_v2: String?
}
