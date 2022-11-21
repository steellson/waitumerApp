//
//  MainPresenter.swift
//  waitumerApp
//
//  Created by Andrey Pochepaev on 05.11.2022.
////

import Foundation

protocol MainViewProtocol: AnyObject {
    func show()
}

protocol MainPresenterProtocol: AnyObject {
    init(view: MainViewProtocol!, router: Router, user: User, appwriteService: AppwriteSerciveProtocol)
    func loginAnnonymus()
    func logout()
    func openCurrentOrder()
    func getOrder() -> Order
}


class MainPresenter: MainPresenterProtocol {
    
    weak var view: MainViewProtocol!
    var router: Router!
    var user: User
    let appwriteService: AppwriteSerciveProtocol
    
    required init(view: MainViewProtocol!, router: Router, user: User, appwriteService: AppwriteSerciveProtocol) {
        self.view = view
        self.router = router
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
    
    func openCurrentOrder() {
        let order = getOrder()
        router.showCurrent(order: order)
    }
    
    func getOrder() -> Order {
        let order = Order(id: 0, description: "test", isReady: false, isArchived: false)
        return order
    }
    
}
