//
//  HomeCoordinator.swift
//  CoordinatorApp
//
//  Created by Idwall Go Dev 008 on 04/04/22.
//

import Foundation
import UIKit

class HomeCoordinator: Coordinator {
    private(set)var childCoordinators: [Coordinator] = []
    
    private var navigationController: UINavigationController
    /// injetando a dependencia no construtor da class
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let homeViewController = HomeViewController()
        let viewModel = HomeViewModel()
        /// assinando a view model
        viewModel.coordinator = self
        /// Refencia via propriedade
        homeViewController.viewModel = viewModel
        homeViewController.view.backgroundColor = .lightGray
        navigationController.setViewControllers([homeViewController], animated: true)
    }
    
    func detail() {
        let detailCoordinator = DetailCoordinator(navigationController: navigationController)
        detailCoordinator.parentCoordinator = self
        childCoordinators.append(detailCoordinator)
        
        detailCoordinator.start()
    }
    
    
}
