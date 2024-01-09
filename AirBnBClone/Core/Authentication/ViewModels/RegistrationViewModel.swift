//
//  RegistrationViewModel.swift
//  AirBnBClone
//
//  Created by User on 8.1.2024.
//

import Foundation

class RegistrationViewModel: ObservableObject {
    
    private let authManager: AuthManager
    
    init(manager: AuthManager) {
        self.authManager = manager
    }
    
    func createUser(withEmail email: String, password: String, fullname: String) async {
        do {
            try await self.authManager.createUser(withEmail: email, password: password, fullname: fullname)
        } catch {
            print("DEBUG // failed to create user with error : \(error.localizedDescription)")
        }
    }
}
