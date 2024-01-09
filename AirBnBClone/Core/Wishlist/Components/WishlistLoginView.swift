//
//  WishlistLoginView.swift
//  AirBnBClone
//
//  Created by User on 9.1.2024.
//

import SwiftUI

struct WishlistLoginView: View {
    @Binding var showLogin: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            VStack(alignment: .leading, spacing: 4) {
                Text("Log in to view your wishlists")
                    .font(.headline)
                
                Text("You can create, view or edit wishlist once you've logged in")
                    .font(.footnote)
            }
            
            LogInButton(action: {
                self.showLogin.toggle()
            })
            
            Spacer()
        }
        
    }
}

#Preview {
    WishlistLoginView(showLogin: .constant(false))
}
