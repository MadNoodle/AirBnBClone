//
//  ProfileView.swift
//  AirBnBClone
//
//  Created by User on 6.1.2024.
//

import SwiftUI

struct ProfileView: View {
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
        VStack {
            if self.authManager.userSessionId == nil {
                ProfileLoginView(showLogin: self.$showLogin)
            } else {
                UserProfileHeaderView()
            }
            
            VStack(spacing: 24) {
                ProfileOptionRowView(imageName: "gear", title: "Settings")
                ProfileOptionRowView(imageName: "gear", title: "Accessibility")
                ProfileOptionRowView(imageName: "questionmark.circle", title: "Visit the help center")
            }
            .padding(.vertical)
            
            if self.authManager.userSessionId != nil {
                Button(action: {
                    self.authManager.signOut()
                }, label: {
                    Text("Log out")
                        .foregroundStyle(.black)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .underline()
                })
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .sheet(isPresented: self.$showLogin, content: {
            LoginView(authManager: self.authManager)
        })
        .padding()
    }
}

#Preview {
    ProfileView(authManager: DIContainer.mock.authManager)
}
