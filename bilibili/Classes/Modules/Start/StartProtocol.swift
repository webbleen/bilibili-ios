//
//  StartProtocol.swift
//  bilibili
//
//  Created by IB投信 on 3/2/20.
//  Copyright © 2020 webbleen. All rights reserved.
//

import Foundation

protocol StartProtocol {
    func onGetCacheSuccess(model: StartInfoModel?)
    func onGetCacheFailure(error: Error)
}
