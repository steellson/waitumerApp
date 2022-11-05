//
//  MainView.swift
//  waitumerApp
//
//  Created by Andrey Pochepaev on 05.11.2022.
//

import Foundation
import UIKit

class MainView: UIView {
    
    private let testButton = WTButton.buildDefaultButton(with: "Login Annonymus", color: .systemFill)
    private let logoutButton = WTButton.buildDefaultButton(with: "Logout", color: .systemGray)

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = .systemBackground
        
        addSubview(testButton)
        testButton.addTarget(self, action: #selector(loginAnnonymusPressed), for: .touchUpInside)
        
        addSubview(logoutButton)
        logoutButton.addTarget(self, action: #selector(logoutPressed), for: .touchUpInside)
    }
    
    @objc private func loginAnnonymusPressed() {
        Task {
            try await appwrite.loginAnnonymus()
        }
    }
    
    @objc private func logoutPressed() {
        Task {
            try await appwrite.logout()
        }
    }

//MARK: - Layout
    
    override func layoutSubviews() {
        setupTestButtonLayout()
        setupLogoutButtonLayout()
    }
    
    private func setupTestButtonLayout() {
        testButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            testButton.widthAnchor.constraint(equalToConstant: 300),
            testButton.heightAnchor.constraint(equalToConstant: 60),
            testButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            testButton.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    private func setupLogoutButtonLayout() {
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            logoutButton.widthAnchor.constraint(equalToConstant: 200),
            logoutButton.heightAnchor.constraint(equalToConstant: 40),
            logoutButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            logoutButton.topAnchor.constraint(equalTo: testButton.bottomAnchor, constant: 250)
        ])
    }
}
