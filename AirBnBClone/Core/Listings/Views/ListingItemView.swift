//
//  ListingView.swift
//  AirBnBClone
//
//  Created by User on 6.1.2024.
//

import SwiftUI

struct ListingItemView: View {
    
    let listing: Listing
    
    var body: some View {
        VStack(spacing: 8) {
            // images
            CarouselView(listing: self.listing)
                .frame(height: 320)
                .clipShape(RoundedRectangle(cornerRadius: 10))

            // listing details
            HStack(alignment: .top) {
                // Details
                
                VStack(alignment: .leading) {
                    Text("\(self.listing.city), \(self.listing.state)")
                        .fontWeight(.bold)
                        .foregroundStyle(.black)
                    
                    Text("12 mi may")
                        .foregroundStyle(.gray)
                    
                    Text("Nov 3 - 10")
                        .foregroundStyle(.gray)
                    
                    HStack(spacing: 4) {
                        Text("$ \(self.listing.pricePerNight)")
                            .fontWeight(.semibold)
                        
                        Text("night")
                    }
                    .foregroundStyle(.black)
                }
                
                Spacer()
                
                // Rating
                HStack(spacing: 2) {
                    Image(systemName: "star.fill")
                    
                    Text("\(self.listing.rating)")
                }
                .foregroundStyle(.black)
            }
            
            .font(.footnote)
        }
    }
}

#Preview {
    ListingItemView(listing: PreviewProvider.shared.listings[0])
}
