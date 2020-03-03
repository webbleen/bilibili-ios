//
//  LaunchRepository.swift
//  bilibili
//
//  Created by IB投信 on 3/3/20.
//  Copyright © 2020 webbleen. All rights reserved.
//

import Foundation
import UIKit

protocol LaunchRepositoryProtocol {
    func exec(requestModel: LaunchRequestModel) -> Void
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
    
    func exec(requestModel: LaunchRequestModel) {
        apiClient.execute(request: self) { (result: Result<ApiResponse<LaunchResponseModel>>) in
            switch result {
            case let .success(response):
                let msgID = response.entity.code
                print(msgID ?? "")
                //completionHandler(.success(url))
            case let .failure(error):
                print(error.localizedDescription)
                //completionHandler(.failure(error))
            }
        }
        
    }
}
