//
//  StartViewController.swift
//  bilibili
//
//  Created by IB投信 on 3/2/20.
//  Copyright © 2020 webbleen. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {
    
    private var startPresenter = StartPresenter<StartViewController>()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
        
        self.startPresenter.initial(self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        getStartInfo()
    }

    func getStartInfo() -> Void {
        self.startPresenter.getInfo()
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


extension StartViewController: StartProtocol {
    func onGetCacheSuccess(model: StartInfoModel?) {
        print("CacheViewController:onGetCacheSuccess")
    }
    
    func onGetCacheFailure(error: Error) {
        print("CacheViewController:onGetCacheFailure")
    }
}
