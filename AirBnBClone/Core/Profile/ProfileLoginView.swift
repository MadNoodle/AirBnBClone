//
//  ProfileLoginView.swift
//  AirBnBClone
//
//  Created by User on 9.1.2024.
//

import SwiftUI

struct ProfileLoginView: View {
    
    // MARK: - Properties
    @Binding var showLogin: Bool
    
    // MARK: - UI
    var body: some View {
        // Profile log in view
        VStack(alignment: .leading, spacing: 32) {
            VStack(alignment: .leading, spacing: 8) {
                Text("Profile")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                
                
                Text("Log in to start planning your next trip")
            }
            
            LogInButton(action: {
                self.showLogin.toggle()
            })
            
            HStack {
                Text("Dont have an account?")
                    .font(.caption)
                
                Text("Sign up")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .underline()
                    .onTapGesture {
                        print("Sign up")
                    }
            }
        }
    }
}

#Preview {
    ProfileLoginView(showLogin: .constant(false))
}
