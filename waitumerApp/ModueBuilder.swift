//
//  ModueBuilder.swift
//  waitumerApp
//
//  Created by Andrey Pochepaev on 05.11.2022.
//

import UIKit

protocol ModuleBuilderProtocol {
    static func buildMainModule() -> UIViewController
}

class ModuleBuilder: ModuleBuilderProtocol {
    
    static func buildMainModule() -> UIViewController {
        let view = MainViewController()
        let appwrite = AppwriteService()
        let user = User(name: "annonymus", isLoggined: false)
        let presenter = MainPresenter(view: view, user: user, appwriteService: appwrite)
        view.presenter = presenter
        
        return view
    }
    
}
