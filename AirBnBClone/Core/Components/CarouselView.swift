//
//  CarouselView.swift
//  AirBnBClone
//
//  Created by User on 6.1.2024.
//

import SwiftUI

struct CarouselView: View {
    // MARK: - Properties
    let listing: Listing
    
    // MARK: UI
    var body: some View {
        // images
        TabView {
            ForEach(self.listing.imageURLs, id: \.self) { image in
                Image(image, bundle: nil)
                    .resizable()
            }
        }
        .tabViewStyle(.page)
    }
}

#Preview {
    CarouselView(listing: PreviewProvider.shared.listings[1])
}
