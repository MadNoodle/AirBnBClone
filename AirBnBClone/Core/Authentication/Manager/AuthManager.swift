//
//  AuthManager.swift
//  AirBnBClone
//
//  Created by User on 8.1.2024.
//

import Foundation

class AuthManager: ObservableObject {
    @Published var userSessionId: String?
    
    let service: AuthenticationService
    
    init(service: AuthenticationService) {
        self.service = service
    }
    
    @MainActor
    func login(withEmail email: String, password: String) async throws {
        do {
            self.userSessionId = try await self.service.login(withEmail: email, password: password)
            print("DEBUG: USER SESSIONID: \(self.userSessionId)")
        } catch {
            throw error
        }
    }
    
    @MainActor
    func createUser(withEmail email: String, password: String, fullname: String) async throws{
        do {
            self.userSessionId = try await self.service.createUser(withEmail: email, password: password, fullname: fullname)
        } catch {
            throw error
        }
    }
    
    @MainActor
    func signOut() {
        try? self.service.signOut()
        self.userSessionId = nil
    }
}
