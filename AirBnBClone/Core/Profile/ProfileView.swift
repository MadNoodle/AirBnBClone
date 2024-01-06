//
//  ProfileView.swift
//  AirBnBClone
//
//  Created by User on 6.1.2024.
//

import SwiftUI

struct ProfileView: View {
    
    
    var body: some View {
        VStack {
            // Profile log in view
            VStack(alignment: .leading, spacing: 32) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Profile")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                    
                    
                    Text("Log in to start planning your next trip")
                }
                
                LogInButton(action: {
                    print("Log in Button pressed")
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
            
            VStack(spacing: 24) {
                ProfileOptionRowView(imageName: "gear", title: "Settings")
                ProfileOptionRowView(imageName: "gear", title: "Accessibility")
                ProfileOptionRowView(imageName: "questionmark.circle", title: "Visit the help center")
            }
            .padding(.vertical)
        }
        .padding()
    }
}

#Preview {
    ProfileView()
}

struct LogInButton: View {
    let action: () -> Void
    
    var body: some View {
        Button {
            self.action()
        } label: {
            Text("Log in")
                .foregroundStyle(.white)
                .font(.subheadline)
                .fontWeight(.semibold)
        }
        .frame(width: 360)
        .frame(height: 48)
        .background(.pink)
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}
