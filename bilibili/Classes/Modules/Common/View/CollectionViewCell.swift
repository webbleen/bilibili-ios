//
//  CollectionViewCell.swift
//  bilibili
//
//  Created by WENBIN.LI on 3/6/20.
//  Copyright © 2020 webbleen. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupSubviews() {
        layer.cornerRadius = 5
        layer.masksToBounds = true
        backgroundColor = .gray
    }
}
