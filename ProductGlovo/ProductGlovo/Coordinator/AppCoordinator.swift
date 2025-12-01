//
//  AppCoordinator.swift
//  ProductGlovo
//
//  Created by Nikunj Modi on 23/11/25.
//

import Foundation
import UIKit

final class AppCoordinator {
    private let window: UIWindow
    private let navigationController = UINavigationController()
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let productCoordinator = ProductCoordinator(navController: navigationController)
        productCoordinator.start()
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
