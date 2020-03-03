//
//  LaunchRequest.swift
//  bilibili
//
//  Created by IB投信 on 3/2/20.
//  Copyright © 2020 webbleen. All rights reserved.
//

import Foundation
import UIKit

struct LaunchRequest: ApiRequest {
    
    var urlRequest: URLRequest {
        let width = UIScreen.main.bounds.width
        let height = UIScreen.main.bounds.height
        let scale_screen = UIScreen.main.scale
        
        let url: URL! = URL(string: "http://app.bilibili.com/x/splash?build=3390&channel=appstore&height=\(height*scale_screen)&plat=1&width=\(width*scale_screen)")
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpMethod = "GET"
        return request
    }
}
