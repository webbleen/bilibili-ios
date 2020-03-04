//
//  APIResponse.swift
//  THSwift
//
//  Created by webbleen on 2019/11/23.
//  Copyright © 2019 webbleen. All rights reserved.
//

import Foundation

// Can be thrown when we can't even reach the API
struct NetWorkRequestError: Error {
    let error: Error?
    
    var localizedDescription: String {
        return error?.localizedDescription ?? "Network request error - no other information"
    }
}

// Can be thrown when we reach the API but the it returns a 4xx or a 5xx
struct ApiError: Error {
    let data: Data?
    let httpUrlResponse: HTTPURLResponse
}

// Can be thrown by InitializableWithData.init(data: Data?) implementations when parsing the data

struct ApiParseError: Error {
    static let code = 999
    
    let data: Data?
    let httpUrlResponse: HTTPURLResponse
    let error: Error?
    
    var localizedDescription: String {
        return error?.localizedDescription ?? "Network request error - no other information"
    }
}

// This wraps a successful API response and it includes the generic data as well
// The reason why we need this wrapper is that we want to pass to the client the status code and the raw response as well
struct ApiResponse<T:Decodable> {
    let entity: T
    
    let data: Data?
    let httpUrlResponse: HTTPURLResponse
    
    init(data: Data?, httpUrlResponse: HTTPURLResponse) throws {
        do {
            self.entity = try JSONDecoder().decode(T.self, from: data ?? Data())
            self.httpUrlResponse = httpUrlResponse
            self.data = data
        } catch {
            throw ApiParseError(data: data, httpUrlResponse: httpUrlResponse, error: error)
        }
    }
}

// Some endpoints might return a 204 No Content
struct VoidResponse: Decodable { }

extension NSError {
    static func createParseError() -> NSError {
        return NSError(domain: "com.webbleen.bilibili",
                       code: ApiParseError.code,
                       userInfo: [NSLocalizedDescriptionKey : "A Parsing error occured"])
    }
}
