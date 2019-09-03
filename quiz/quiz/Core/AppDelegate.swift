//
//  AppDelegate.swift
//  quiz
//
//  Created by Samanta Coutinho on 2019-08-15.
//  Copyright © 2019 Samanta Coutinho. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var appCoordinator: AppCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        keyboardConfig()
        window = UIWindow(frame: UIScreen.main.bounds)
        appCoordinator = AppCoordinator(window: self.window)
        appCoordinator?.start()
        return true
    }
    
    private func keyboardConfig() {
        IQKeyboardManager.shared.enable = true
    }
}

