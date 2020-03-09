//
//  ApplicationController.swift
//  bilibili
//
//  Created by WENBIN.LI on 3/5/20.
//  Copyright © 2020 webbleen. All rights reserved.
//

import UIKit
import XCGLogger

let log: XCGLogger = {
    let log = XCGLogger.default
    #if DEBUG
        log.outputLevel = .debug
        log.levelDescriptions[.verbose] = "🗯"
        log.levelDescriptions[.debug] = "🔹"
        log.levelDescriptions[.info] = "ℹ️"
        log.levelDescriptions[.warning] = "⚠️"
        log.levelDescriptions[.error] = "‼️"
        log.levelDescriptions[.severe] = "💣"
    #else
        log.outputLevel = .none
    #endif
    return log
}()

class ApplicationController {
    fileprivate var application: UIApplication?

    static let initialLaunchCount = 0

    var window: UIWindow

    private let blurView = UIVisualEffectView(effect: UIBlurEffect(style: .light))


    // MARK: Init
    init() {
        window = UIWindow.init(frame: UIScreen.main.bounds)
        window.backgroundColor = .white
    }

    // MARK: - Lifecycle
    func launch(application: UIApplication, options: [UIApplication.LaunchOptionsKey: Any]?) {
        self.application = application
        //application.setMinimumBackgroundFetchInterval(UIApplication.backgroundFetchIntervalNever)

        setup()
        handleLaunchOptions(options)
    }

    func willResignActive() {
        applyBlurEffect()
        checkForNotificationSettingsChange(appActive: false)
    }

    func didBecomeActive() {
        removeBlurEffect()
        checkForNotificationSettingsChange(appActive: true)
    }

    func willEnterForeground() {
    }

    func didEnterBackground() {
    }

    // MARK: Services/Assets
    func performFetch(_ completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
    }

    private func setup() {
        var presentMainScreen: (() -> Void)!
        presentMainScreen = {
            let tabBarVC = TabBarViewController()
            let nav = UINavigationController(rootViewController: tabBarVC)
            nav.modalPresentationStyle = .fullScreen

            self.window.rootViewController = nav
        }

        let launchVC = LaunchViewController()
        launchVC.paramObj = LaunchParamObj(launchType: .normal)
        launchVC.presentMainScreen = presentMainScreen
        window.rootViewController = launchVC

        window.makeKeyAndVisible()
    }

    private func handleLaunchOptions(_ options: [UIApplication.LaunchOptionsKey: Any]?) {
        if let url = options?[.url] as? URL {
            do {
                let file = try Data(contentsOf: url)
                if !file.isEmpty {
                    //Store.trigger(name: .openFile(file))
                }
            } catch let error {
                print("Could not open file at: \(url), error: \(error)")
            }
        }
    }

    private func applyBlurEffect() {
        blurView.alpha = 1.0
        blurView.frame = window.frame
        window.addSubview(blurView)
    }

    private func removeBlurEffect() {
        UIView.animate(withDuration: 0.1, animations: {
            self.blurView.alpha = 0.0
        }, completion: { _ in
                self.blurView.removeFromSuperview()
            })
    }
}

extension ApplicationController {
    func open(url: URL) -> Bool {
        //handleUrl
        return true
    }

    func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
        if userActivity.activityType == NSUserActivityTypeBrowsingWeb {
            return open(url: userActivity.webpageURL!)
        }
        return false
    }
}

// MARK: - Push notifications
extension ApplicationController {
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {

    }

    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print("[PUSH] failed to register for remote notifications: \(error.localizedDescription)")
    }

    private func checkForNotificationSettingsChange(appActive: Bool) {
        if appActive {
            // check if notification settings changed

        } else {

        }
    }
}
