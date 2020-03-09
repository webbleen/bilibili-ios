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

    var path: String {
        return baseUrl + endPoint
    }

    func createGetRequest<T: Encodable>(requestModel: T) -> URLRequest {
        var components = URLComponents(string: path)
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
        urlRequest.httpMethod = "GET"

        return urlRequest
    }

}
