//
//  MapListingPreviewView.swift
//  AirBnBClone
//
//  Created by User on 7.1.2024.
//

import SwiftUI

struct ListingMapPreviewView: View {
    // MARK: - Properties
    let listing: Listing
    
    // MARK: - UI
    var body: some View {
        VStack {
            TabView{
                ForEach(self.listing.imageURLs, id: \.self) { image in
                Image(image)
                        .resizable()
                        .scaledToFill()
                        .clipShape(Rectangle())
                }
            }
            .frame(height: 200)
            .tabViewStyle(.page)
            
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text("\(self.listing.city), \(self.listing.state)")
                        .fontWeight(.semibold)
                    
                    Text ("7 nights Nov 3 - 10")
                        .foregroundStyle(.gray)
                    
                    Text("$\(listing.pricePerNight) night")
                        .fontWeight(.semibold)
                }
                
                Spacer()
                
                Image(systemName: "star.fill")
                Text("\(self.listing.rating)")
            }
            .font(.footnote)
            .padding(8)
        }
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .padding()
    }
}

#Preview {
    ListingMapPreviewView(listing: PreviewProvider.shared.listings[0])
}
