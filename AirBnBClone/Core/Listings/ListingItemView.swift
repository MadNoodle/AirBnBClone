//
//  ListingView.swift
//  AirBnBClone
//
//  Created by User on 6.1.2024.
//

import SwiftUI

struct ListingItemView: View {
    
    private var images = [
        "listing-1",
        "listing-2",
        "listing-3",
        "listing-4",
    ]
    
    var body: some View {
        VStack(spacing: 8) {
            // images
            CarouselView()
                .frame(height: 320)
                .clipShape(RoundedRectangle(cornerRadius: 10))

            
            // listing details
            HStack(alignment: .top) {
                // Details
                
                VStack(alignment: .leading) {
                    Text("Miami, Florida")
                        .fontWeight(.bold)
                        .foregroundStyle(.black)
                    
                    Text("12 mi may")
                        .foregroundStyle(.gray)
                    
                    Text("Nov 3 - 10")
                        .foregroundStyle(.gray)
                    
                    HStack(spacing: 4) {
                        Text("$567")
                            .fontWeight(.semibold)
                        
                        Text("night")
                    }
                    .foregroundStyle(.black)
                }
                
                Spacer()
                
                // Rating
                HStack(spacing: 2) {
                    Image(systemName: "star.fill")
                    
                    Text("4.08")
                }
                .foregroundStyle(.black)
            }
            
            .font(.footnote)
        }
    }
}

#Preview {
    ListingItemView()
}
