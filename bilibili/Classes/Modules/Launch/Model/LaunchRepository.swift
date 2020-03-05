//
//  LaunchRepository.swift
//  bilibili
//
//  Created by WENBIN.LI on 3/3/20.
//  Copyright © 2020 webbleen. All rights reserved.
//

import Foundation
import UIKit

protocol LaunchRepositoryProtocol {
    func execute(requestModel: LaunchRequestModel, onSuccess: @escaping (LaunchResponseModel) -> Void, onFailure: @escaping (Error) -> Void) -> Void
}

class LaunchRepository: BaseRepository, LaunchRepositoryProtocol {
    
    init() {
        super.init(endPoint: "/x/v2/splash/list")
    }
    
    func execute(requestModel: LaunchRequestModel, onSuccess: @escaping (LaunchResponseModel) -> Void, onFailure: @escaping (Error) -> Void) {
        let urlRequest = self.createGetRequest(requestModel: requestModel)
        apiClient.execute(request: urlRequest) { (result: Result<ApiResponse<LaunchResponseModel>>) in
            switch result {
            case let .success(response):
                return onSuccess(response.data!)
            case let .failure(error):
                return onFailure(error)
            }
        }
    }
}
