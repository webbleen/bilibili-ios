//
//  LaunchViewController.swift
//  bilibili
//
//  Created by IB投信 on 3/2/20.
//  Copyright © 2020 webbleen. All rights reserved.
//

import UIKit

class LaunchViewController: UIViewController {
   
    lazy private var presenter: LaunchPresenter = {
        return LaunchPresenter<LaunchViewController>()
    }()
   
    lazy private var launchView: LaunchView = {
        let launchView = LaunchView(frame: self.view.frame)
        return launchView
    }()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
        
        self.presenter.initial(self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //getLaunchInfo()
        view = launchView
    }

    func getLaunchInfo() -> Void {
        self.presenter.getInfo()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


extension LaunchViewController: LaunchProtocol {
    func onGetCacheSuccess(model: LaunchModel?) {
        print("CacheViewController:onGetCacheSuccess")
    }
    
    func onGetCacheFailure(error: Error) {
        print("CacheViewController:onGetCacheFailure")
    }
}
