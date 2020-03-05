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
        launchView.delegate = self
        
        return launchView
    }()
    
    var presentMainScreen: (() -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupSubviews()
        
        view = launchView
    }
    
    func setupSubviews() {
        let launchParamObj = self.paramObj as! LaunchParamObj
        switch launchParamObj.launchType {
        case .normal:
            normalLaunch()
        default:
            activeLaunch()
        }
    }
    
    func normalLaunch() {
//        let width = UIScreen.main.bounds.width
//        let height = UIScreen.main.bounds.height
//        let scale_screen = UIScreen.main.scale
        
        var requestModel = LaunchRequestModel()
        
        requestModel.actionKey="appkey"
        requestModel.ad_extra="F6209EEC4D712ADB7AAF94480A782BC716EE9DEBCC17500924ADA69D3BB944658AC7ED5BCBBB5A9C01B865997BDBB27A8928E47471131F974E01DB280EB8E910C61210A235D6FBE7FD43AB7FBA00B33247DF9F955A0C14FAE64582A9B7AAE1A4787746DA06114809AF858ECD27FB841792EABC7B17B6B7A93A9540071ABEBF8B857A814B42DDD773D5C6F2E577709CC005FB17D007E90FE78862D392D059312AA0B5616FCB033E7A24B4D8C02F0804DA2DAD8E1FB3C20D8FA44F73D1F2570C34052EA3096711E8D1F9F0D44980C8D07E94056A88C3ED717E1A7E4953B056EF8C86F3CD4A635950868AB148AB6B8D5AFBA6B87D6867273FDE2D962D9752DE10874EC8E0FE9F32E54D2E10577C3CF43A11D1C590F39E4BB82FC0D68E1BE96E73F6A0EAD7C0CF3F105C629B4D9E3CD873B1B7804891B2DFAA420C97B3E7BBFC0660A1ED52D21E5F6BCCD1C3989B8C7901E193924066585ADBD1A95504A365AAC679D994B1E6178C20F62DFCE88131F504BCD4F97106D40DB6CFECE3331FEAEE4DBAFF49A38425013CCCDE6E23DD6EBFCDA4F7CD2CE06FE262CCAF4F39BCD4620F2594BFDBC1B135FE6549C05B84FF486C97F7A113FFAF45389A3D6E20413E62C8D78C9B44C7938F021B6BD6AA55F20067F0A5A4E5E59B8E9CF5D73D039A37A5FD8881A98DA288B8F0F400480E6952A227FFBFEE2CFDDCA1ABBDC74BA9C7D5767388"
        requestModel.appkey="27eb53fc9058f8c3"
        requestModel.birth=""
        requestModel.build=9220
        requestModel.device="phone"
        requestModel.height=2208
        requestModel.mobi_app="iphone"
        requestModel.platform="ios"
        requestModel.sign="9ac09b9f2b528e34d50112a7e4f4ade6"
        requestModel.statistics="%7B%22appId%22%3A1%2C%22version%22%3A%225.54.1%22%2C%22abtest%22%3A%22%22%2C%22platform%22%3A1%7D"
        requestModel.ts="1583338533"
        requestModel.width=1242
        
        getLaunchInfo(requestModel: requestModel)
    }
    
    func activeLaunch() {
        
    }

    func getLaunchInfo(requestModel: LaunchRequestModel) -> Void {
        self.presenter.getLaunchInfo(requestModel: requestModel)
    }
}



extension LaunchViewController: LaunchViewDelegate {
    func launchImageDidTap() {
        self.presenter.launchImageDidTap()
    }
    func launchImageDismiss() {
        self.dismiss(animated: true, completion: nil)
        self.presentMainScreen?()
    }
}

extension LaunchViewController: LaunchPresenterOutput {
    func launchSuccess() {
        
    }
}
