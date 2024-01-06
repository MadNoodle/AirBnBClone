//
//  ExploreView.swift
//  AirBnBClone
//
//  Created by User on 6.1.2024.
//

import SwiftUI

struct ExploreView: View {
    /// allows
    @State private var showSearchView = false
    
    var body: some View {
        NavigationStack {
            if self.showSearchView {
                DestinationSearchView(show: self.$showSearchView)
            } else {
                ScrollView {
                    SearchAndFilterBar()
                        .onTapGesture {
                            withAnimation(.snappy) {
                                self.showSearchView.toggle()
                            }
                        }
                    
                    LazyVStack(spacing: 32) {
                        ForEach(0 ... 10, id: \.self) { listing in
                            NavigationLink(value: listing) {
                                ListingItemView()
                                    .frame(height:400)
                                    .clipShape(RoundedRectangle(cornerRadius:  10))
                            }
                        }
                    }
                    .padding()
                }
                .navigationDestination(for: Int.self) { listing in
                    ListingDetailsView()
                        .navigationBarBackButtonHidden()
                }
            }
        }
    }
}

#Preview {
    ExploreView()
}
