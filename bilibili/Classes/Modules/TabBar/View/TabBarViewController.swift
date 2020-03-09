//
//  TabBarViewController.swift
//  bilibili
//
//  Created by WENBIN.LI on 3/4/20.
//  Copyright © 2020 webbleen. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setupSubviews()
    }

    private func setupSubviews() {

        let homeItem = UITabBarItem(title: "首页", image: UIImage(named: "bottom_tabbar_mainhome_normal")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "bottom_tabbar_mainhome_selected")?.withRenderingMode(.alwaysOriginal))
        let channelItem = UITabBarItem(title: "频道", image: UIImage(named: "bottom_tabbar_pegasuschannel_normal")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "bottom_tabbar_pegasuschannel_selected")?.withRenderingMode(.alwaysOriginal))
        let dynamicItem = UITabBarItem(title: "动态", image: UIImage(named: "bottom_tabbar_followinghome_normal")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "bottom_tabbar_followinghome_selected")?.withRenderingMode(.alwaysOriginal))
        let vipItem = UITabBarItem(title: "会员购", image: UIImage(named: "bottom_tabbar_mallhome_normal")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "bottom_tabbar_mallhome_selected")?.withRenderingMode(.alwaysOriginal))
        let mineItem = UITabBarItem(title: "我的", image: UIImage(named: "bottom_tabbar_user_center_normal")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "bottom_tabbar_user_center_selected")?.withRenderingMode(.alwaysOriginal))

        let homeVC = HomeViewController()
        homeVC.tabBarItem = homeItem

        let channelVC = ChannelViewController()
        channelVC.tabBarItem = channelItem

        let dynamicVC = DynamicViewController()
        dynamicVC.tabBarItem = dynamicItem

        let vipVC = VipViewController()
        vipVC.tabBarItem = vipItem

        let mineVC = MineViewController()
        mineVC.tabBarItem = mineItem

        viewControllers = [homeVC, channelVC, dynamicVC, vipVC, mineVC]
        for (_, item) in tabBar.items!.enumerated() {
            let normalAttributes = [NSAttributedString.Key.foregroundColor: UIColor(red: 0.48, green: 0.48, blue: 0.48, alpha: 1.0)]
            let selectedAttributes = [NSAttributedString.Key.foregroundColor: UIColor(red: 0.98, green: 0.45, blue: 0.60, alpha: 1.0)]
            item.setTitleTextAttributes(normalAttributes, for: .normal)
            item.setTitleTextAttributes(selectedAttributes, for: .selected)
        }
    }

}
