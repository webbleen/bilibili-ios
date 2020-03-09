//
//  HomeView.swift
//  bilibili
//
//  Created by WENBIN.LI on 3/9/20.
//  Copyright © 2020 webbleen. All rights reserved.
//

import UIKit

class HomeView: BaseView {

    weak var delegate: HomeViewDelegate?

    var items: [HomeRecommendItem] = []

    lazy var recommendCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .white

        // 注册cell
        collectionView.register(HomeCollectionCell.self, forCellWithReuseIdentifier: "\(HomeCollectionCell.self)")

        return collectionView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupUI() {
        backgroundColor = .white

        guard let window = UIApplication.shared.delegate?.window else {
            //dismiss()
            return
        }
        window?.isHidden = false
        window?.addSubview(self)

        addSubview(recommendCollectionView)
        if let _ = recommendCollectionView.superview {
            recommendCollectionView.snp.makeConstraints { (make) in
                make.left.right.equalToSuperview()
                make.top.equalToSuperview()
                make.bottom.equalToSuperview()
            }
        }
    }

    func reloadData(items: [HomeRecommendItem]) {
        self.items.append(contentsOf: items)
        recommendCollectionView.reloadData()
    }
}

extension HomeView: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(HomeCollectionCell.self)", for: indexPath) as! HomeCollectionCell

        cell.bind(items[indexPath.item])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (self.bounds.width - 30) / 2
        let height = width * 9 / 16 + 60
        return CGSize(width: width, height: height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: self.bounds.width, height: 10)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: self.bounds.width, height: 10)
    }
}
