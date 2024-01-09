//
//  RegistrationView.swift
//  AirBnBClone
//
//  Created by User on 8.1.2024.
//

import SwiftUI

struct RegistrationView: View {
    // MARK: - Properties
    @StateObject var viewModel: RegistrationViewModel
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var fullname: String = ""
    @Environment(\.dismiss) var dismiss
    
    // MARK: - Init
    init(authManager: AuthManager) {
        self._viewModel = StateObject(wrappedValue: RegistrationViewModel(manager: authManager))
    }
    
    // MARK: - UI
    var body: some View {
        Spacer()
        
        VStack {
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
                
                TextField("Enter your fullname", text: self.$fullname)
                    .primaryStyle()
            }
            
            Button("Create account") {
                Task {
                    await self.viewModel.createUser(
                        withEmail: self.email,
                        password: self.password,
                        fullname: self.fullname
                    )
                    self.dismiss()
                }
            }
            .primary()
            .disabled(!self.formIsValid)
            .opacity(self.formIsValid ? 1.0 : 0.7)
            .padding(.vertical)
            
            
        }
        
        Spacer()
        
        Divider()
        
        Button {
            self.dismiss()
        } label: {
            HStack(spacing: 2) {
                Text("Already have an account ")
                
                Text("Sign in")
                    .fontWeight(.semibold)
            }
            .font(.footnote)
            .padding(.vertical)
        }
    }
}

// MARK: - Validation protocol
extension RegistrationView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !self.email.isEmpty &&
        self.email.contains("@") &&
        !self.password.isEmpty &&
        self.password.count > 5 &&
        !self.fullname.isEmpty
    }
}

#Preview {
    RegistrationView(authManager: DIContainer.mock.authManager)
}
