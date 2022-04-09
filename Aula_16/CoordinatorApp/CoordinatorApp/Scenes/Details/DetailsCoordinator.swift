//
//  DetailsCoordinator.swift
//  CoordinatorApp
//
//  Created by Idwall Go Dev 008 on 04/04/22.
//

import Foundation
import UIKit

class DetailCoordinator: Coordinator {
    private(set) var childCoordinators: [Coordinator] = []
    
    private let navigationController: UINavigationController
    
    var parentCoordinator: HomeCoordinator?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    //centralizar o fluxo de ingeção de dependencia e navegação
    func start() {
        let viewController = DetailsViewController()
        
        let viewModel = DetailsViewModel()
        viewModel.coordinator = self
        viewController.viewModel = viewModel
        viewController.view.backgroundColor = .orange
        navigationController.pushViewController(viewController, animated: true)
    }
    
    
}
