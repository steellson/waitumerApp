//
//  ModueBuilder.swift
//  waitumerApp
//
//  Created by Andrey Pochepaev on 05.11.2022.
//

import UIKit

protocol ModuleBuilderProtocol {
    func buildMainModule(with router: Router) -> UIViewController
    func buildOrdersModule(with router: Router, order: Order) -> UIViewController
}

class ModuleBuilder: ModuleBuilderProtocol {

    func buildMainModule(with router: Router) -> UIViewController {
        let view = MainViewController()
        let appwrite = AppwriteService()
        let user = User(name: "annonymus", isLoggined: false)
        let presenter = MainPresenter(view: view, router: router, user: user, appwriteService: appwrite)
        view.presenter = presenter
        
        return view
    }
    
    func buildOrdersModule(with router: Router, order: Order) -> UIViewController {
        let view = OrdersViewController()
        let appwrite = AppwriteService()
        let presenter = OrdersPresenter(view: view, router: router, order: order, appwriteService: appwrite)
        view.presenter = presenter
        
        return view
    }
    
    
}
