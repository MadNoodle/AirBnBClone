//
//  LoginViewModel.swift
//  AirBnBClone
//
//  Created by User on 8.1.2024.
//

import Foundation

class LoginViewModel: ObservableObject {
    private let authManager: AuthManager
    
    init(manager: AuthManager) {
        self.authManager = manager
    }
    
    func login(withEmail email: String, password: String) async {
        do {
            try await self.authManager.login(withEmail: email, password: password)
        } catch {
            print("DEBUG // An error occured : \(error.localizedDescription)")
        }
    }
}
