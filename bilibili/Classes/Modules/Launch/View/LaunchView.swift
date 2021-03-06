//
//  LaunchView.swift
//  bilibili
//
//  Created by WENBIN.LI on 3/2/20.
//  Copyright © 2020 webbleen. All rights reserved.
//


import Foundation
import AVFoundation

import UIKit
import SnapKit
import SDWebImage

class LaunchView: BaseView {

    weak var delegate: LaunchViewDelegate?

    var timer: Timer!
    var interval: Int = 3

    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer.init(target: self, action: #selector(imageTouchAction))
        gesture.numberOfTouchesRequired = 1
        imageView.addGestureRecognizer(gesture)
        return imageView
    }()

    lazy var skipButton: UIButton = {
        let skipButton = UIButton()
        skipButton.backgroundColor = UIColor(white: 0, alpha: 0.1)
        skipButton.setTitle("Skip \(interval)s", for: .normal)
        skipButton.setTitleColor(.white, for: .normal)
        skipButton.titleLabel?.font = .systemFont(ofSize: 12)
        skipButton.layer.cornerRadius = 15
        skipButton.layer.masksToBounds = true
        skipButton.addTarget(self, action: #selector(dismiss), for: .touchUpInside)
        return skipButton
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    func setupUI() {
        backgroundColor = .white

        guard let window = UIApplication.shared.delegate?.window else {
            dismiss()
            return
        }
        window?.isHidden = false
        window?.addSubview(self)

        addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
//        imageView.sd_setImage(with: URL(string: "https://img.zcool.cn/community/01e3ee5a6f2aa8a801213466f492ba.JPG@2o.jpg"))
        imageView.image = UIImage.init(named: "bilibili_splash_default")
        imageView.contentMode = .center

        addSubview(skipButton)
        skipButton.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview().offset(-35)
            make.right.equalToSuperview().offset(-25)
            make.size.equalTo(CGSize(width: 80, height: 30))
        }

        startTimer()
    }

    private func startTimer() {
        if timer == nil {
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerInterval), userInfo: nil, repeats: true)
        }
    }

    @objc private func timerInterval() {
        interval -= 1
        if interval <= 0 {
            interval = 0
            dismiss()
            return
        }
        skipButton.setTitle("Skip \(interval)s", for: .normal)
    }

    @objc private func imageTouchAction() {
        delegate?.launchImageDidTap()
        dismiss()
    }

    @objc func dismiss() {
        if timer != nil {
            if timer.isValid {
                timer.invalidate()
            }
        }
        UIView.animate(withDuration: 0.5, animations: {
            self.imageView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            self.alpha = 0
        }, completion: { Bool in
                self.removeFromSuperview()
            })
        delegate?.launchImageDismiss()
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}


extension LaunchView {

}
