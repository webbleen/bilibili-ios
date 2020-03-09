//
//  HomeViewController.swift
//  bilibili
//
//  Created by WENBIN.LI on 3/4/20.
//  Copyright © 2020 webbleen. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {

    lazy private var recommendPresenter: HomeRecommendPresenterInput = {
        return HomeRecommendPresenter(view: self)
    }()

    lazy private var homeView: HomeView = {
        let homeView = HomeView(frame: self.view.frame)
        homeView.delegate = self
        return homeView
    }()

    var items: [HomeRecommendItem] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        setupSubviews()
        view = homeView
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    func setupSubviews() {
        feedIndex()
    }

    private func feedIndex() {
        var requestModel = HomeRecommendRequestModel()
        requestModel.actionKey = "appkey"
        requestModel.autoplay_card = 2
        requestModel.banner_hash = "15064348936283427737"
        requestModel.build = 8470
        requestModel.column = 2
        requestModel.device = "phone"
        requestModel.flush = 0
        requestModel.fnval = 16
        requestModel.fnver = 0
        requestModel.idx = "1556032858"
        requestModel.mobi_app = "iphone"
        requestModel.nerwork = "wifi"
        requestModel.open_event = ""
        requestModel.parent_mode = 0
        requestModel.plaform = "ios"
        requestModel.pull = 1
        requestModel.qn = 32
        requestModel.recsys_mode = 0
        requestModel.ts = String(Date.init().timeIntervalSince1970)
        requestModel.ad_extra = "F6209EEC4D712ADB7AAF94480A782BC716EE9DEBCC17500924ADA69D3BB944657E5AE18A4127A3018DD1A25F41DBC08064621D0506C70D3AC6F915E7D8C443422A9279DE75DF68E47468B8E782ED2CC4048023B5DEB8ACE96D72F28FA80A88B85C6A8D253FD93A365F62A09EBF55D9AD96DC6DBB0E398722F15A51E2A8C18B9330AAB1D74326C29892B107586F1D88CD3B1E45C47E27292B97F61D134A4FEA390BFC1CCC7B62E82B874D0F05D740510FAC30A422CA890035D254B17B7211CD63A799CF3086BE894F3227557A01DC9763BE1C993EF67D44CFC4C1C970CAB82F2A13D3AF81B4D10361E74C8414B994995B981D1788D24B14C058C5F944D4C76077D5093196F74061FBD965D39A936AC991590A4DB8CD5185906AA7008CF29DF0CE49ED80932CF5416F53241CE085C13326641465B37279A3A7D5322D45CF20462BEE0E399DE982EFB40E427FE9A2E4ECDB23E9FE347E7E9E3D7977942A5045E5DC3CB2AA655A6D7694326B0AE2F3172D16FCA6112DA34D1D9AC941539271486CC33E7ACE86A7DEA89E09FB4BE311E3F33447E1CD87DBAF2124F7D4784C4F1CD59354A81FD337726B2E0C6B831EC77776B674750390071D618B05862651D35F3E7E462ABDC1F04966DEB18CDC1EC56A14DDB7A0D509E7FD2E61373D154F8F265008"

        self.recommendPresenter.feedIndex(requestModel: requestModel)
    }
}

extension HomeViewController: HomeRecommendPresenterOutput {
    func feedIndexFinish(responseModel: HomeRecommendResponseModel?) {
        print("HomeViewController:feedIndexFinish")
        guard let items = responseModel?.items else {
            return
        }

        if items.count > 0 {
            self.items.append(contentsOf: items)
            self.homeView.reloadData(items: self.items)
        }
    }
}

extension HomeViewController: HomeViewDelegate {

}
