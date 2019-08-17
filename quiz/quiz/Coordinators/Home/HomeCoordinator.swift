//
//  HomeCoordinator.swift
//  quiz
//
//  Created by Samanta Coutinho on 2019-08-16.
//  Copyright © 2019 Samanta Coutinho. All rights reserved.
//

import Foundation
import UIKit

class HomeCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var rootViewController: UIViewController { return navigationController }
    
    private lazy var navigationController: UINavigationController = {
        let navigationC = UINavigationController()
        navigationC.navigationBar.barTintColor = .white
        navigationC.navigationBar.shadowImage = UIImage()
        navigationC.navigationBar.isTranslucent = false
        return navigationC
    }()
    
    func start() {
        let viewModel = HomeViewModel(homeManager: HomeManager.shared)
        let homeScreen = HomeController(viewModel: viewModel)
        navigationController.pushViewController(homeScreen, animated: false)
    }
}
