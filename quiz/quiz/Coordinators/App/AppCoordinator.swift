//
//  AppCoordinator.swift
//  quiz
//
//  Created by Samanta Coutinho on 2019-08-16.
//  Copyright © 2019 Samanta Coutinho. All rights reserved.
//

import Foundation
import UIKit

class AppCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var rootViewController: UIViewController { return navigationController }
    
    private lazy var navigationController: UINavigationController = {
        let navigationController = UINavigationController()
        return navigationController
    }()
    
    let window: UIWindow?
    
    public init(window: UIWindow?) {
        self.window = window
        self.window?.rootViewController = self.rootViewController
        self.window?.makeKeyAndVisible()
    }
    
    func start() {
        let homeCoordinator = HomeCoordinator()
        homeCoordinator.start()
        addChildCoordinator(homeCoordinator)
        rootViewController.present(homeCoordinator.rootViewController, animated: false, completion: nil)
    }
}
