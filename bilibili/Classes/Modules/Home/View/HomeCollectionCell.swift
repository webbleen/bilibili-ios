//
//  HomeCollectionCell.swift
//  bilibili
//
//  Created by IB投信 on 3/6/20.
//  Copyright © 2020 webbleen. All rights reserved.
//

import UIKit

class HomeCollectionCell: UICollectionViewCell {
    
    var imageView: UIImageView!
    var titleLabel: UILabel!
    var subTitleLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if let _ = imageView.superview {
            imageView.snp.remakeConstraints { (make) in
                make.left.right.top.equalToSuperview()
                make.height.equalTo(self.bounds.height / 2 + 20)
            }
        }
        
        if let _ = titleLabel.superview {
            titleLabel.snp.remakeConstraints { (make) in
                make.left.equalToSuperview().offset(10)
                make.right.equalToSuperview().offset(-10)
                make.top.equalTo(self.imageView.snp.bottom)
                make.bottom.equalTo(40)
            }
        }
        
        if let _ = subTitleLabel.superview {
            subTitleLabel.snp.remakeConstraints { (make) in
                make.left.equalToSuperview().offset(10)
                make.right.equalToSuperview().offset(-10)
                make.top.equalTo(self.titleLabel.snp.bottom)
                make.bottom.equalTo(20)
            }
        }
    }
    
    private func setupSubviews() {
        layer.cornerRadius = 5
        layer.masksToBounds = true
        backgroundColor = .systemPink
        
        imageView = UIImageView.init(frame: CGRect.zero)
        imageView.image = UIImage.init(named: "bilibili_splash_default")
        contentView.addSubview(imageView)
        
        titleLabel = UILabel.init(frame: CGRect.zero)
        titleLabel.font = UIFont.systemFont(ofSize: 13)
        titleLabel.numberOfLines = 2
        titleLabel.text = "aaaaaaaa"
        contentView.addSubview(titleLabel)

        subTitleLabel = UILabel.init(frame: CGRect.zero)
        subTitleLabel.font = UIFont.systemFont(ofSize: 12)
        subTitleLabel.textColor = .gray
        subTitleLabel.text = "bbbbbbbb"
        contentView.addSubview(subTitleLabel)
    }
    
    func bind(_ model:HomeRecommendResponseModel) {
        //imageView.setImage()
        //titleLabel.text = "aaaaaaaa"
        //subTitleLabel.text = "bbbbbbbb"
    }
}
