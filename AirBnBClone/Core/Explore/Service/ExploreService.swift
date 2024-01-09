//
//  ExploreService.swift
//  AirBnBClone
//
//  Created by User on 7.1.2024.
//

import Foundation

class MockExploreService {
    func fetchService() async throws -> [Listing] {
        return PreviewProvider.shared.listings
    }
}
