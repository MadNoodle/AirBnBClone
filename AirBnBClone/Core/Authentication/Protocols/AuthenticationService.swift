//
//  AuthenticationService.swift
//  AirBnBClone
//
//  Created by User on 9.1.2024.
//

import Foundation

protocol AuthenticationService {
    func login(withEmail email: String, password: String) async throws -> String?
    
    func createUser(withEmail email: String, password: String, fullname: String) async throws -> String?
    
    func signOut() throws
}
