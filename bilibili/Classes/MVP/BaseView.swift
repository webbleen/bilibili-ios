//
//  BaseView.swift
//  bilibili
//
//  Created by IB投信 on 3/3/20.
//  Copyright © 2020 webbleen. All rights reserved.
//

import Foundation
import UIKit

class BaseView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let viewName = String(describing: type(of: self))
        
        initView(name: viewName)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initView(name: String) {
        
    }
}
