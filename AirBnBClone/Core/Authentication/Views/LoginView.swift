//
//  LoginView.swift
//  AirBnBClone
//
//  Created by User on 8.1.2024.
//

import SwiftUI

struct LoginView: View {
    
    // MARK: - Dependencies
    private let authManager: AuthManager
    
    // MARK: - Properties
    @StateObject var viewModel: LoginViewModel
    @Environment(\.dismiss) var dismiss
    @State private var email: String = ""
    @State private var password: String = ""
    
    // MARK: - Init
    init(authManager: AuthManager) {
        self.authManager = authManager
        self._viewModel = StateObject(wrappedValue: LoginViewModel(manager: authManager))
    }
    
    // MARK: - UI
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                Image(.logo)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .padding()
                VStack {
                    TextField("Enter your email", text: self.$email)
                        .primaryStyle()
                    
                    SecureField("Enter your password", text: self.$password)
                        .primaryStyle()
                }
                
                NavigationLink {
                    
                } label: {
                    Text("Forgot password")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.vertical)
                        .padding(.trailing, 28)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                
                LogInButton(action: {
                    Task {
                        await self.viewModel.login(
                            withEmail:self.email,
                            password:self.password
                        )
                    }
                    self.dismiss()
                })
                .disabled(!self.formIsValid)
                .opacity(self.formIsValid ? 1.0 : 0.7)
                
                Spacer()
                
                Divider()
                
                NavigationLink {
                    RegistrationView(authManager: self.authManager)
                        .navigationBarBackButtonHidden()
                } label: {
                    HStack(spacing: 2) {
                        Text("Do not have an account? ")
                        
                        Text("Sign up")
                            .fontWeight(.semibold)
                    }
                    .font(.footnote)
                    
                } .padding(.vertical)
            }
        }
    }
}

// MARK: - Validation protocol
extension LoginView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !self.email.isEmpty &&
        self.email.contains("@") &&
        !self.password.isEmpty
    }
}

#Preview {
    LoginView(authManager: DIContainer.mock.authManager)
}
