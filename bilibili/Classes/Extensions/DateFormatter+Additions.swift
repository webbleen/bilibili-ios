//
//  DateFormatter+Additions.swift
//  bilibili
//
//  Created by WENBIN.LI on 3/6/20.
//  Copyright © 2020 webbleen. All rights reserved.
//

import Foundation

extension DateFormatter {
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.timeZone = .current
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "yyyyMMddHHmmss"
        return formatter
    }()
}
