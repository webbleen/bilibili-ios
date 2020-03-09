//
//  HomeRecommendPresenter.swift
//  bilibili
//
//  Created by WENBIN.LI on 3/9/20.
//  Copyright © 2020 webbleen. All rights reserved.
//

import Foundation

class HomeRecommendPresenter: BasePresenter, HomeRecommendPresenterInput {

    private let recommendRepository: HomeRecommendRepository

    private var view: HomeRecommendPresenterOutput

    required init(view: HomeRecommendPresenterOutput) {
        self.recommendRepository = HomeRecommendRepository()

        self.view = view
    }

    func feedIndex(requestModel: HomeRecommendRequestModel) {
        recommendRepository.execute(requestModel: requestModel, onSuccess: { responseModel in
            self.view.feedIndexFinish(responseModel: responseModel)
        }) { error in
            print("feedIndex error:\(error.localizedDescription)")
        }
    }
}

protocol HomeRecommendPresenterInput {
    init(view: HomeRecommendPresenterOutput)
    func feedIndex(requestModel: HomeRecommendRequestModel)
}

protocol HomeRecommendPresenterOutput {
    func feedIndexFinish(responseModel: HomeRecommendResponseModel?)
}
