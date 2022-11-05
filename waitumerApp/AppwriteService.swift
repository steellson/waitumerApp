//
//  AppwriteService.swift
//  waitumerApp
//
//  Created by Andrey Pochepaev on 04.11.2022.
//

import Foundation
import Appwrite

protocol AppwriteSerciveProtocol {
    func loginAnnonymus() async throws
    func logout() async throws
}

class AppwriteService: AppwriteSerciveProtocol {
        
    private let endPoint = "http://johncuba.ru/v1"
    private let project = "632377d604123f2e0809"

    
    
    func loginAnnonymus() async throws {
        let client = Client()
            .setEndpoint("http://johncuba.ru/v1/account/sessions/anonymous")
            .setProject(project)
        let account = Account(client)
        do {
           let session = try await account.createAnonymousSession()
            print(String(describing: session))
        } catch let error {
            print(error.localizedDescription)
        }
        
    }
    
    func logout() async throws {
        let client = Client()
            .setEndpoint("http://johncuba.ru/v1/account/sessions/current")
            .setProject(project)
        let account = Account(client)
        do {
            _ = try await account.deleteSession(sessionId: "current")
            print("Session deleted")
        } catch let error{
            print(error.localizedDescription)
        }
    }
    
    
}
