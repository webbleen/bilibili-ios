//
//  StartPresenter.swift
//  bilibili
//
//  Created by IB投信 on 3/2/20.
//  Copyright © 2020 webbleen. All rights reserved.
//

import Foundation

struct StartPresenter<U> where U: StartProtocol {
    
    var view: U?
    var apiClient: ApiClient?
    mutating func initial(_ view: U) {
        self.view = view
        self.apiClient = ApiClient(urlSessionConfiguration: URLSessionConfiguration.default,
        completionHandlerQueue: OperationQueue.main)
    }
    
    init() { }
    
    func getInfo() {
        let startRequest = StartRequest()
        apiClient?.execute(request: startRequest) { (result: Result<ApiResponse<StartInfoModel>>) in
            switch result {
            case let .success(response):
                let msgID = response.entity.msgID
                print(msgID ?? "")
                //completionHandler(.success(url))
            case let .failure(error):
                print(error.localizedDescription)
                //completionHandler(.failure(error))
            }
        }
    }
}
