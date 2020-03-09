//
//  LaunchParamObj.swift
//  bilibili
//
//  Created by WENBIN.LI on 3/3/20.
//  Copyright © 2020 webbleen. All rights reserved.
//

import Foundation

class LaunchParamObj: BaseParamObj {
    enum LaunchType {
        case normal
        case active
    }

    var launchType: LaunchType
    init(launchType: LaunchType = .normal) {
        self.launchType = launchType
    }
}
