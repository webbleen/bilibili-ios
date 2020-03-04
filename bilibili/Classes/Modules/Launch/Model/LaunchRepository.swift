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

class LaunchRepository: BaseRepository, ApiRequest, LaunchRepositoryProtocol {
    
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
    
    init() {
        super.init(baseUrl: "http://app.bilibili.com", endPoint: "/x/splash")
    }
    
    func execute(requestModel: LaunchRequestModel, onSuccess: @escaping (LaunchResponseModel) -> Void, onFailure: @escaping (Error) -> Void) {
        apiClient.execute(request: self) { (result: Result<ApiResponse<LaunchResponseModel>>) in
            switch result {
            case let .success(response):
                return onSuccess(response.entity)
            case let .failure(error):
                return onFailure(error)
            }
        }
    }
}
