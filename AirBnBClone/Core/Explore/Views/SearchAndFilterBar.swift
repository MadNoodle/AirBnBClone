//
//  SearchAndFilterBar.swift
//  AirBnBClone
//
//  Created by User on 6.1.2024.
//

import SwiftUI

struct SearchAndFilterBar: View {
    // MARK: - Properties
    @Binding var location: String

    // MARK: - UI
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
            
            VStack(alignment: .leading, spacing: 2) {
                Text(self.location.isEmpty ? "Where to?" : self.location)
                    .font(.footnote)
                    .fontWeight(.semibold)
                
                Text("\(self.location.isEmpty ? "Anywhere - " : "")Any Week - Add guests")
                    .font(.footnote)
                    .foregroundStyle(.gray)
            }
            
            Spacer()
            
            Button(action: {
                
            }, label: {
                Image(systemName: "line.3.horizontal.decrease.circle")
                    .foregroundStyle(.black)
            })
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
        .overlay {
            Capsule()
                .stroke(lineWidth: 0.5)
                .foregroundStyle(Color(.systemGray))
                .shadow(color: .black.opacity(0.4), radius: 2)
                
        }
        .padding()
    }
}

#Preview {
    SearchAndFilterBar(location: .constant("Los Angeles"))
}
