//
//  HomeRecommendRepository.swift
//  bilibili
//
//  Created by WENBIN.LI on 3/9/20.
//  Copyright © 2020 webbleen. All rights reserved.
//

import Foundation

protocol HomeRecommendRepositoryProtocol {
    func execute(requestModel: HomeRecommendRequestModel, onSuccess: @escaping (HomeRecommendResponseModel?) -> Void, onFailure: @escaping (Error) -> Void) -> Void
}

class HomeRecommendRepository: BaseRepository, HomeRecommendRepositoryProtocol {

    init() {
        super.init(endPoint: "/x/v2/feed/index")
    }

    func execute(requestModel: HomeRecommendRequestModel, onSuccess: @escaping (HomeRecommendResponseModel?) -> Void, onFailure: @escaping (Error) -> Void) {
        let urlRequest = self.createGetRequest(requestModel: requestModel)
        apiClient.execute(request: urlRequest) { (result: Result<ApiResponse<HomeRecommendResponseModel>>) in
            switch result {
            case let .success(response):
                return onSuccess(response.data)
            case let .failure(error):
                return onFailure(error)
            }
        }
    }
}
