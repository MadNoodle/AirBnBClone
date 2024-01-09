//
//  MockAuthenticationService.swift
//  AirBnBClone
//
//  Created by User on 8.1.2024.
//

import Foundation

struct MockAuthenticationService: AuthenticationService {
    func login(withEmail email: String, password: String) async throws -> String? {
        return NSUUID().uuidString
    }
    
    func createUser(withEmail email: String, password: String, fullname: String) async throws -> String? {
        return NSUUID().uuidString
    }
    
    func signOut() throws {}
}
