//
//  CarouselView.swift
//  AirBnBClone
//
//  Created by User on 6.1.2024.
//

import SwiftUI

struct CarouselView: View {
    
    private var images = [
        "listing-1",
        "listing-2",
        "listing-3",
        "listing-4",
    ]
    
    var body: some View {
            // images
            TabView {
                ForEach(self.images, id: \.self) { image in
                    Image(image, bundle: nil)
                        .resizable()
                }
            }
            .tabViewStyle(.page)
        }
}

#Preview {
    CarouselView()
}
