//
//  CachePresenter.swift
//  THSwift
//
//  Created by webbleen on 2019/11/24.
//  Copyright © 2019 webbleen. All rights reserved.
//

import Foundation

struct CachePresenter<U> where U: CacheProtocol {
    
    var view: U?
    var apiClient: ApiClient?
    mutating func initial(_ view: U) {
        self.view = view
        self.apiClient = ApiClient(urlSessionConfiguration: URLSessionConfiguration.default,
        completionHandlerQueue: OperationQueue.main)
    }
    
    init() { }
    
    typealias Value = Int
    func getCache(by integer: Value) {
        let cacheRequest = CacheRequest(integer: integer)
        apiClient?.execute(request: cacheRequest) { (result: Result<ApiResponse<CacheModel>>) in
            switch result {
            case let .success(response):
                let url = response.entity.url
                print(url ?? "")
                //completionHandler(.success(url))
            case let .failure(error):
                print(error.localizedDescription)
                //completionHandler(.failure(error))
            }
        }
    }
}
