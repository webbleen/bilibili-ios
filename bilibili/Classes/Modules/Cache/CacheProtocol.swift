//
//  CacheProtocol.swift
//  THSwift
//
//  Created by webbleen on 2019/11/24.
//  Copyright © 2019 webbleen. All rights reserved.
//

import Foundation

protocol CacheProtocol {
    func onGetCacheSuccess(model: CacheModel?)
    func onGetCacheFailure(error: Error)
}
