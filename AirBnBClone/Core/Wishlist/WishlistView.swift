//
//  WishlistView.swift
//  AirBnBClone
//
//  Created by User on 6.1.2024.
//

import SwiftUI

struct WishlistView: View {
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 32) {
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Log in to view your wishlists")
                        .font(.headline)
                    
                    Text("You can create, view or edit wishlist once you've logged in")
                        .font(.footnote)
                }
                
                LogInButton(action: {
                    print("Log in Button pressed")
                })
                
                Spacer()
                
            }
            .navigationTitle(Text("Wishlists"))
            .padding()
        }
    }
}

#Preview {
    WishlistView()
}
