//
//  OrdresPresenter.swift
//  waitumerApp
//
//  Created by Andrey Pochepaev on 21.11.2022.
//

import Foundation

protocol OrdersViewProtocol: AnyObject {
    func showCurrent(order: Order)
}

protocol OrdersPresenterProtocol: AnyObject {
    init(view: OrdersViewProtocol, router: Router, order: Order, appwriteService: AppwriteSerciveProtocol)
    func presentCurrentOrder()
}

class OrdersPresenter: OrdersPresenterProtocol {
    
    weak var view: OrdersViewProtocol!
    var router: Router!
    var order: Order?
    let appwriteService: AppwriteSerciveProtocol!
    
    required init(view: OrdersViewProtocol, router: Router, order: Order, appwriteService: AppwriteSerciveProtocol) {
        self.view = view
        self.router = router
        self.order = order
        self.appwriteService = appwriteService
        

    }
    
    func presentCurrentOrder() {
        guard self.order != nil else { return }
        self.view.showCurrent(order: order!)
        
        Task {
            try await appwriteService.orderDidAccepted()
        }
    }
    
    
}
