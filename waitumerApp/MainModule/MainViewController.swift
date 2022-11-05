//
//  MainViewController.swift
//  waitumerApp
//
//  Created by Andrey Pochepaev on 04.11.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    var presenter: MainPresenterProtocol!
    
    private let testButton = WTButton.buildDefaultButton(with: "Login Annonymus", color: .systemFill)
    private let logoutButton = WTButton.buildDefaultButton(with: "Logout", color: .systemGray2)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupController()
    }
    
    
//MARK: - Setup Methods
    
    private func setupController() {
        view.backgroundColor = .systemGray3
        
        view.addSubview(testButton)
        testButton.addTarget(self, action: #selector(loginAnnonymusPressed), for: .touchUpInside)
        
        view.addSubview(logoutButton)
        logoutButton.addTarget(self, action: #selector(logoutPressed), for: .touchUpInside)
        
        setupTestButtonLayout()
        setupLogoutButtonLayout()
    }
    
    @objc private func loginAnnonymusPressed() {
        self.presenter.loginAnnonymus()
    }
    
    @objc private func logoutPressed() {
        self.presenter.logout()
    }

//MARK: - Layout
    
    private func setupTestButtonLayout() {
        testButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            testButton.widthAnchor.constraint(equalToConstant: 300),
            testButton.heightAnchor.constraint(equalToConstant: 60),
            testButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            testButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    private func setupLogoutButtonLayout() {
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            logoutButton.widthAnchor.constraint(equalToConstant: 200),
            logoutButton.heightAnchor.constraint(equalToConstant: 40),
            logoutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoutButton.topAnchor.constraint(equalTo: testButton.bottomAnchor, constant: 250)
        ])
    }
}

//MARK: - +++++

extension MainViewController: MainViewProtocol {
    
    func show() {
        print("MainVC Showed")
    }
}
