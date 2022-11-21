//
//  Router.swift
//  waitumerApp
//
//  Created by Andrey Pochepaev on 21.11.2022.
//

import Foundation
import UIKit

protocol RouterProtocol {
    var navigationController: UINavigationController? { get set }
    var moduleBuilder: ModuleBuilderProtocol? { get set }
    func initialViewController()
    func showCurrent(order: Order?)
}

class Router: RouterProtocol {
    
    var navigationController: UINavigationController?
    var moduleBuilder: ModuleBuilderProtocol?
    
    init(navigationController: UINavigationController, moduleBuilder: ModuleBuilderProtocol) {
        self.navigationController = navigationController
        self.moduleBuilder = moduleBuilder
    }
    
    func initialViewController() {
        if let navigationController = navigationController {
            guard let startVC = moduleBuilder?.buildMainModule(with: self) else { return }
            navigationController.pushViewController(startVC, animated: true)
        }
    }
    
    func showCurrent(order: Order?) {
        if let navigationController = navigationController {
            guard order != nil else { return }
            guard let ordersVC = moduleBuilder?.buildOrdersModule(with: self, order: order!) else { return }
            navigationController.pushViewController(ordersVC, animated: true)
        }
    }
    
    
}
