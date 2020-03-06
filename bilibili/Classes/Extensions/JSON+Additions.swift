//
//  JSON+Additions.swift
//  bilibili
//
//  Created by WENBIN.LI on 3/6/20.
//  Copyright © 2020 webbleen. All rights reserved.
//

import Foundation

extension JSONDecoder {
    static let createDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        //decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .formatted(.dateFormatter)
        return decoder
    }()
}
