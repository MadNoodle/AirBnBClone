//
//  MainTabView.swift
//  AirBnBClone
//
//  Created by User on 6.1.2024.
//

import SwiftUI

struct MainTabView: View {
    // MARK: - Dependencies
    private let dependencies: DIContainer
    
    // MARK: - Init
    init(dependencies: DIContainer) {
        self.dependencies = dependencies
    }
    
    // MARK: - UI
    var body: some View {
        TabView {
            ExploreView(service: self.dependencies.exploreService)
                .tabItem { Label("Explore", systemImage: "magnifyingglass") }
            
            WishlistView(authManager: self.dependencies.authManager)
                .tabItem { Label("Wishlists", systemImage: "heart") }
            
            ProfileView(authManager: self.dependencies.authManager)
                .tabItem { Label("Profile", systemImage: "person") }
        }
    }
}

#Preview {
    MainTabView(dependencies: DIContainer.mock)
}
