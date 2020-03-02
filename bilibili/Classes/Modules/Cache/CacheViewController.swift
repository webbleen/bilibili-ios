//
//  CacheViewController.swift
//  THSwift
//
//  Created by webbleen on 2019/11/24.
//  Copyright © 2019 webbleen. All rights reserved.
//

import UIKit
import Foundation

class CacheViewController: UIViewController {
    private var cachePresenter = CachePresenter<CacheViewController>()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
        
        self.cachePresenter.initial(self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        reloadData()
    }
    
    func reloadData() {
        // request network
        self.cachePresenter.getCache(by: 2000)
    }
}

extension CacheViewController: CacheProtocol {
    func onGetCacheSuccess(model: CacheModel?) {
        print("CacheViewController:onGetCacheSuccess")
    }
    
    func onGetCacheFailure(error: Error) {
        print("CacheViewController:onGetCacheFailure")
    }
}
