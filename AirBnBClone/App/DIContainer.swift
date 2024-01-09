//
//  DIContainer.swift
//  AirBnBClone
//
//  Created by User on 8.1.2024.
//

import Foundation

enum DIContainer {
    case live
    case mock
    
    var authManager: AuthManager {
        switch self {
        case .live:
            return .init(service: FirebaseAuthService())
        case .mock:
            return .init(service: MockAuthenticationService())
        }
    }
    
    var exploreService: MockExploreService {
        switch self {
        case .live:
            return MockExploreService()
        case .mock:
            return MockExploreService()
        }
    }
}
