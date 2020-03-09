//
//  ApiClient.swift
//  THSwift
//
//  Created by webbleen on 2019/11/23.
//  Copyright © 2019 webbleen. All rights reserved.
//

import Foundation

protocol ApiAdaptor {
    func execute<T>(request: URLRequest, completionHandler: @escaping (_ result: Result<ApiResponse<T>>) -> Void)
}

protocol URLSessionProtocol {
    func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask
}

extension URLSession: URLSessionProtocol { }

class ApiClient: ApiAdaptor {
    let urlSession: URLSessionProtocol

    init(urlSession: URLSessionProtocol) {
        self.urlSession = urlSession
    }

    init(urlSessionConfiguration: URLSessionConfiguration, completionHandlerQueue: OperationQueue) {
        urlSession = URLSession(configuration: urlSessionConfiguration, delegate: nil, delegateQueue: completionHandlerQueue)
    }

    // MARK: - ApiClient
    func execute<T>(request urlRequest: URLRequest, completionHandler: @escaping (Result<ApiResponse<T>>) -> Void) {
        let task = urlSession.dataTask(with: urlRequest) { (data, response, error) in
            guard let httpUrlResponse = response as? HTTPURLResponse, let data = data else {
                //网络连接错误
                log.error([urlRequest.url?.path, error?.localizedDescription])
                completionHandler(.failure(NetWorkRequestError(error: error)))
                return
            }

            log.debug([urlRequest.url?.path as Any, httpUrlResponse.statusCode])
            let successRange = 200...299
            if successRange.contains(httpUrlResponse.statusCode) {
                do {
                    // 正常业务处理
                    let response = try JSONDecoder.createDecoder.decode(ApiResponse<T>.self, from: data)
                    completionHandler(.success(response))
                } catch let err {
                    // JSONDecoder解析失败处理
                    log.error([urlRequest.url?.path, err.localizedDescription])
                    completionHandler(.failure(ApiParseError(data: data, httpUrlResponse: httpUrlResponse, error: err)))
                }
            } else {
                //HTTP服务器状态错误
                completionHandler(.failure(ApiError(data: data, httpUrlResponse: httpUrlResponse)))
            }
        }
        task.resume()
    }
}
