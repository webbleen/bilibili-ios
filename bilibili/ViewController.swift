//
//  ViewController.swift
//  bilibili
//
//  Created by IB投信 on 3/2/20.
//  Copyright © 2020 webbleen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var window: UIWindow?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.window = UIWindow.init(frame: UIScreen.main.bounds)
        self.window?.backgroundColor = .white
        
        let launchVC = LaunchViewController()
        launchVC.paramObj = LaunchParamObj(launchType: .normal)
        //let navigationController = UINavigationController(rootViewController: launchVC)
        self.window?.rootViewController = launchVC
        
        self.window?.makeKeyAndVisible()
        
        UINavigationBar.appearance().isTranslucent = false
    }
}

