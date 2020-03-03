//
//  Presenter.swift
//  THSwift
//
//  Created by webbleen on 2019/11/24.
//  Copyright © 2019 webbleen. All rights reserved.
//

import Foundation

protocol Presenter {
    associatedtype T
    var view: T? { get set }
    mutating func initial(_ view: T)
}

extension CachePresenter: Presenter {}
