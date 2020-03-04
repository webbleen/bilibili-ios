//
//  LaunchProtocol.swift
//  bilibili
//
//  Created by WENBIN.LI on 3/2/20.
//  Copyright © 2020 webbleen. All rights reserved.
//

import Foundation

protocol LaunchProtocol {
    func onGetCacheSuccess(model: LaunchResponseModel?)
    func onGetCacheFailure(error: Error)
}
