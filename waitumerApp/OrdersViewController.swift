//
//  OrdersViewController.swift
//  waitumerApp
//
//  Created by Andrey Pochepaev on 21.11.2022.
//

import Foundation
import UIKit

class OrdersViewController: UIViewController {
    
    var presenter: OrdersPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupController()
        presenter.presentCurrentOrder()
    }
    
    
//MARK: - Setup Methods
    
    private func setupController() {
        view.backgroundColor = .systemGray3
    }
    
}

extension OrdersViewController: OrdersViewProtocol {
    func showCurrent(order: Order) {
        // =
    }
}
