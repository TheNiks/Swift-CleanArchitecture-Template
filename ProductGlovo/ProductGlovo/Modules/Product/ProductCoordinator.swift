//
//  ProductCoordinator.swift
//  ProductGlovo
//
//  Created by Nikunj Modi on 01/12/25.
//

import Foundation
import UIKit

final class ProductCoordinator {
    private let navigationController: UINavigationController
    
    init(navController: UINavigationController) {
        self.navigationController = navController
    }
    
    func start() {
        let productsService = ProductsService()
        let viewModel = ProductsViewModel(service: productsService)
        let productViewController = ProductsViewController(viewModel: viewModel)
        navigationController.pushViewController(productViewController, animated: false)
    }
}
