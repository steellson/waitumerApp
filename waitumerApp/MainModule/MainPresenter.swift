//
//  MainPresenter.swift
//  waitumerApp
//
//  Created by Andrey Pochepaev on 05.11.2022.
//

import Foundation

protocol MainViewProtocol: AnyObject {
    func show()
}

protocol MainPresenterProtocol: AnyObject {
    init(view: MainViewProtocol!, user: User, appwriteService: AppwriteSerciveProtocol)
    func loginAnnonymus()
    func logout()
}


class MainPresenter: MainPresenterProtocol {
    
    weak var view: MainViewProtocol!
    var user: User
    let appwriteService: AppwriteSerciveProtocol
    
    required init(view: MainViewProtocol!, user: User, appwriteService: AppwriteSerciveProtocol) {
        self.view = view
        self.user = user
        self.appwriteService = appwriteService
        
    }
    
    func loginAnnonymus() {
        Task {
            try await appwriteService.loginAnnonymus()
            user.isLoggined = true
        }
    }
    
    func logout() {
        Task {
            try await appwriteService.logout()
            user.isLoggined = false
        }
    }
}
