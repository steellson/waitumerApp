//
//  MainViewController.swift
//  waitumerApp
//
//  Created by Andrey Pochepaev on 04.11.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    var presenter: MainPresenterProtocol!
    
    private let startButton = WTButton.buildDefaultButton(with: "Start!", color: .systemFill)
    private let logoutButton = WTButton.buildDefaultButton(with: "Logout", color: .systemGray2)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupController()
        show()
    }
    
    
//MARK: - Setup Methods
    
    private func setupController() {
        view.backgroundColor = .systemGray3
        
        view.addSubview(startButton)
        startButton.addTarget(self, action: #selector(startButtonDidPressed), for: .touchUpInside)
        
        view.addSubview(logoutButton)
        logoutButton.addTarget(self, action: #selector(logoutPressed), for: .touchUpInside)
        
        setupStartButtonLayout()
        setupLogoutButtonLayout()
    }
    
    @objc private func startButtonDidPressed() {
        self.presenter.loginAnnonymus()
        self.presenter.openCurrentOrder()
    }
    
    @objc private func logoutPressed() {
        self.presenter.logout()
    }

//MARK: - Layout
    
    private func setupStartButtonLayout() {
        startButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            startButton.widthAnchor.constraint(equalToConstant: 150),
            startButton.heightAnchor.constraint(equalToConstant: 60),
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 100)
        ])
    }
    
    private func setupLogoutButtonLayout() {
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            logoutButton.widthAnchor.constraint(equalToConstant: 100),
            logoutButton.heightAnchor.constraint(equalToConstant: 40),
            logoutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoutButton.topAnchor.constraint(equalTo: startButton.bottomAnchor, constant: 250)
        ])
    }
}

//MARK: - +++++

extension MainViewController: MainViewProtocol {
    
    func show() {
        print("MainVC Showed")
    }
}
