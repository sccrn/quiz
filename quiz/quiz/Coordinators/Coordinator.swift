//
//  Coordinator.swift
//  quiz
//
//  Created by Samanta Coutinho on 2019-08-15.
//  Copyright © 2019 Samanta Coutinho. All rights reserved.
//

import Foundation
import UIKit

protocol Coordinator: class {
    var childCoordinators: [Coordinator] { get set }
    var rootViewController: UIViewController { get }
}

extension Coordinator {
    ///Function to start the coordinator
    func start() { }
    
    /// Function to add a child coordinator to the parent coordinator.
    func addChildCoordinator(_ childCoordinator: Coordinator) {
        self.childCoordinators.append(childCoordinator)
    }
    
    /// Function to remove a child coordinator from the parent coordinator.
    func removeChildCoordinator(_ childCoordinator: Coordinator) {
        self.childCoordinators = self.childCoordinators.filter { $0 !== childCoordinator }
    }
}
