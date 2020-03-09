//
//  HomeCollectionCell.swift
//  bilibili
//
//  Created by WENBIN.LI on 3/6/20.
//  Copyright © 2020 webbleen. All rights reserved.
//

import UIKit
import Kingfisher

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
                make.height.equalTo(self.bounds.height - 60)
            }
        }

        if let _ = titleLabel.superview {
            titleLabel.snp.remakeConstraints { (make) in
                make.left.equalToSuperview().offset(5)
                make.right.equalToSuperview().offset(-5)
                make.top.equalTo(self.imageView.snp.bottom)
                //make.bottom.equalTo(40)
            }
        }

        if let _ = subTitleLabel.superview {
            subTitleLabel.snp.remakeConstraints { (make) in
                make.left.equalToSuperview().offset(5)
                make.right.equalToSuperview().offset(-5)
                make.top.equalTo(self.titleLabel.snp.bottom)
                //make.bottom.equalTo(20)
            }
        }
    }

    private func setupSubviews() {
        layer.cornerRadius = 5
        layer.masksToBounds = true
        backgroundColor = .white

        imageView = UIImageView.init(frame: CGRect.zero)
        contentView.addSubview(imageView)

        titleLabel = UILabel.init(frame: CGRect.zero)
        titleLabel.font = UIFont.systemFont(ofSize: 13)
        titleLabel.numberOfLines = 2
        contentView.addSubview(titleLabel)

        subTitleLabel = UILabel.init(frame: CGRect.zero)
        subTitleLabel.font = UIFont.systemFont(ofSize: 12)
        subTitleLabel.textColor = .gray
        contentView.addSubview(subTitleLabel)
    }


    func bind(_ model: HomeRecommendItem) {
        let resource = HomeRecommendResource()
        resource.cacheKey = model.cover ?? ""
        imageView.kf.setImage(with: resource)

        titleLabel.text = model.title
        subTitleLabel.text = "\(model.args?.rname ?? "") * \(model.args?.tname ?? "")"
    }
}

class HomeRecommendResource: Resource {
    var cacheKey: String = ""

    var downloadURL: URL {
        return URL(string: cacheKey) ?? URL(string: "https://webbleen.com/assets/images/favicon.ico")!
    }
}
