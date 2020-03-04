//
//  LaunchPresenter.swift
//  bilibili
//
//  Created by WENBIN.LI on 3/2/20.
//  Copyright © 2020 webbleen. All rights reserved.
//

import Foundation

class LaunchPresenter: BasePresenter, LaunchPresenterInput {
    
    private let launchRepository: LaunchRepositoryProtocol
    
    private var view: LaunchPresenterOutput?
    
    required init(view: LaunchPresenterOutput) {
        self.launchRepository = LaunchRepository()
        
        self.view = view
    }
    
    func getLaunchInfo(requestModel: LaunchRequestModel) {
        /// TODO:
        launchRepository.exec(requestModel: requestModel)
        self.view?.launchSuccess()
    }
    func launchImageDidTap() {
        /// TODO:
        self.view?.launchSuccess()
    }
}

protocol LaunchPresenterInput {
    init(view: LaunchPresenterOutput)
    func getLaunchInfo(requestModel: LaunchRequestModel)
    func launchImageDidTap()
}

protocol LaunchPresenterOutput {
    func launchSuccess()
}
