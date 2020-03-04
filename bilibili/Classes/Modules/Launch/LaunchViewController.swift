//
//  LaunchViewController.swift
//  bilibili
//
//  Created by WENBIN.LI on 3/2/20.
//  Copyright © 2020 webbleen. All rights reserved.
//

import UIKit

class LaunchViewController: BaseViewController {
    
    lazy private var presenter: LaunchPresenterInput = {
        return LaunchPresenter(view: self)
    }()
   
    lazy private var launchView: LaunchView = {
        let launchView = LaunchView(frame: self.view.frame)
        return launchView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUp()
        
        view = launchView
    }
    
    func setUp() {
        let launchParamObj = self.paramObj as! LaunchParamObj
        switch launchParamObj.launchType {
        case .normal:
            normalLaunch()
        default:
            activeLaunch()
        }
    }
    
    func normalLaunch() {
        let width = UIScreen.main.bounds.width
        let height = UIScreen.main.bounds.height
        let scale_screen = UIScreen.main.scale
        
        var requestModel = LaunchRequestModel()
        requestModel.build = "66666"
        requestModel.channel = "appstore"
        requestModel.width = "\(width * scale_screen)"
        requestModel.height = "\(height * scale_screen)"
        
        getLaunchInfo(requestModel: requestModel)
    }
    
    func activeLaunch() {
        
    }

    func getLaunchInfo(requestModel: LaunchRequestModel) -> Void {
        self.presenter.getLaunchInfo(requestModel: requestModel)
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
    func onGetCacheSuccess(model: LaunchResponseModel?) {
        print("LaunchViewController:onGetCacheSuccess")
    }
    
    func onGetCacheFailure(error: Error) {
        print("LaunchViewController:onGetCacheFailure")
    }
}

extension LaunchViewController: LaunchViewDelegate {
    func launchImageDidTap() {
        print("LaunchViewController:launchImageDidTap")
        self.presenter.launchImageDidTap()
    }
}

extension LaunchViewController: LaunchPresenterOutput {
    func launchSuccess() {
        print("LaunchViewController:launchSuccess")
    }
}
