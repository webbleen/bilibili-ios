//
//  Result.swift
//  THSwift
//
//  Created by webbleen on 2019/11/23.
//  Copyright © 2019 webbleen. All rights reserved.
//

import Foundation

enum Result<T> {
    case success(T)
    case failure(Error)
    
    public func dematerialize() throws -> T {
        switch self {
        case let .success(value):
            return value
        case let .failure(error):
            throw error
        }
    }
}
