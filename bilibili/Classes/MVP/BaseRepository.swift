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
    
    init(baseUrl: String, endPoint: String) {
        self.baseUrl = baseUrl
        self.endPoint = endPoint
    }
    
}
