//
//  BaseRepository.swift
//  bilibili
//
//  Created by WENBIN.LI on 3/3/20.
//  Copyright © 2020 webbleen. All rights reserved.
//

import Foundation

class BaseRepository {
    
    final let apiClient = ApiClient(urlSessionConfiguration: URLSessionConfiguration.default,
    completionHandlerQueue: OperationQueue.main)
    
    //var appVersion: String
    
    //var userAgent: String
    
    var baseUrl: String
    
    var endPoint: String
    
    init(baseUrl: String = C.baseUrl, endPoint: String) {
        self.baseUrl = baseUrl
        self.endPoint = endPoint
    }
    
    func createGetRequest<T: Encodable>(requestModel: T) -> URLRequest {
        var components = URLComponents(string: baseUrl + endPoint)
        let mirror = Mirror(reflecting: requestModel)
        
        components?.queryItems = mirror.children.map {
            var value: String?
            switch $0.value {
            case is String:
                value = $0.value as? String
            case is Int:
                value = String($0.value as! Int)
            default:
                value = nil
            }
            return URLQueryItem(name: $0.label!, value: value)
        }.filter({ $0.value != nil })
        
        guard let url = components?.url else {
            fatalError("Error:requestModel to URL Failed")
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.setValue("iphone", forHTTPHeaderField: "APP-KEY")
        urlRequest.setValue("prod", forHTTPHeaderField: "ENV")
        urlRequest.setValue("*/*", forHTTPHeaderField: "Accept")
        urlRequest.setValue("bili-universal/9220 CFNetwork/978.0.7 Darwin/18.7.0 os/ios", forHTTPHeaderField: "User-Agent")
        urlRequest.setValue("gzip", forHTTPHeaderField: "Accept-Encoding")
        urlRequest.setValue("Z04F6909B493D6364F6A957B85F0B630CB21", forHTTPHeaderField: "Buvid")
        urlRequest.httpMethod = "GET"
        
        return urlRequest
    }
    
}
