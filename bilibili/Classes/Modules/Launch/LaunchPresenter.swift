//
//  LaunchPresenter.swift
//  bilibili
//
//  Created by WENBIN.LI on 3/2/20.
//  Copyright © 2020 webbleen. All rights reserved.
//

import Foundation
/*
struct LaunchPresenter<U> where U: LaunchProtocol {
    
    var view: U?
    var apiClient: ApiClient?
    mutating func initial(_ view: U) {
        self.view = view
        self.apiClient = ApiClient(urlSessionConfiguration: URLSessionConfiguration.default,
        completionHandlerQueue: OperationQueue.main)
    }
    
    init() { }
    
    func getInfo() {
        let startRequest = LaunchRequest()
        apiClient?.execute(request: startRequest) { (result: Result<ApiResponse<LaunchResponseModel>>) in
            switch result {
            case let .success(response):
                let msgID = response.entity.data
                print(msgID ?? "")
                //completionHandler(.success(url))
            case let .failure(error):
                print(error.localizedDescription)
                //completionHandler(.failure(error))
            }
        }
    }
}
*/

class LaunchPresenter: BasePresenter, LaunchPresenterInput {
    
    private let launchRepository: LaunchRepositoryProtocol
    
    private var view: LaunchPresenterOutput?
    
    required init(view: LaunchPresenterOutput) {
        self.launchRepository = LaunchRepository()
        
        self.view = view
    }
    
    func getLaunchInfo(requestModel: LaunchRequestModel) {
        /// TODO:
        launchRepository.exec(requestModel: requestModel)
        self.view?.launchSuccess()
    }
    func launchImageDidTap() {
        /// TODO:
        self.view?.launchSuccess()
    }
}

protocol LaunchPresenterInput {
    init(view: LaunchPresenterOutput)
    func getLaunchInfo(requestModel: LaunchRequestModel)
    func launchImageDidTap()
}

protocol LaunchPresenterOutput {
    func launchSuccess()
}
