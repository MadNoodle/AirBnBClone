//
//  WishlistView.swift
//  AirBnBClone
//
//  Created by User on 6.1.2024.
//

import SwiftUI

struct WishlistView: View {
    // MARK: - Dependencies
    @StateObject private var authManager: AuthManager
    
    // MARK: - Properties
    @State private var showLogin = false
    
    // MARK: - Init
    init(authManager: AuthManager) {
        self._authManager = StateObject(wrappedValue: authManager)
    }
    
    // MARK: - UI
    var body: some View {
        NavigationStack {
            VStack {
                if self.authManager.userSessionId == nil {
                    WishlistLoginView(showLogin: self.$showLogin)
                } else {
                    WishlistEmptyStateView()
                }
            }
            .sheet(isPresented: self.$showLogin, content: {
                LoginView(authManager: self.authManager)
            })
            .navigationTitle(Text("Wishlists"))
        }
    }
}

#Preview {
    WishlistView(authManager: DIContainer.mock.authManager)
}
