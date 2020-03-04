//
//  AppDelegate.swift
//  bilibili
//
//  Created by WENBIN.LI on 3/2/20.
//  Copyright © 2020 webbleen. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.initRootUI()
        return true
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        NotificationCenter.default.post(name: Notification.Name(rawValue: "appBecomeActive"), object: nil)
    }
}


extension AppDelegate {
    func initRootUI() {
        window = UIWindow.init(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        let launchVC = LaunchViewController()
        launchVC.paramObj = LaunchParamObj(launchType: .normal)
        // let nav = UINavigationController(rootViewController: launchVC)
        window?.rootViewController = launchVC
        
        window?.makeKeyAndVisible()
    }
}
