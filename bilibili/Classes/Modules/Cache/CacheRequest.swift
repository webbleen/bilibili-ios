//
//  CacheRequest.swift
//  THSwift
//
//  Created by webbleen on 2019/11/24.
//  Copyright © 2019 webbleen. All rights reserved.
//

import Foundation

struct CacheRequest: ApiRequest {
    var integer: Int
    var urlRequest: URLRequest {
        let url: URL! = URL(string: "https://httpbin.org/cache/\(integer)")
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpMethod = "GET"
        return request
    }
}
