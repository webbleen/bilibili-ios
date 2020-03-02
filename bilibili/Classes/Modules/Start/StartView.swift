//
//  StartView.swift
//  bilibili
//
//  Created by IB投信 on 3/2/20.
//  Copyright © 2020 webbleen. All rights reserved.
//

import Foundation
import UIKit

class StartView: UIView {
    var jump: Bool
    var mouseTimer: Timer
    var skip_btn: UIButton
    var skip_time: Int
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
