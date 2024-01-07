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
    @StateObject private var viewModel = ExploreViewModel(service: ExploreService())
    @State private var showMapView = false
    
    
    var body: some View {
        NavigationStack {
            if self.showSearchView {
                DestinationSearchView(
                    show: self.$showSearchView,
                    viewModel: self.viewModel
                )
            } else {
                ZStack(alignment: .bottom) {
                    ScrollView {
                        SearchAndFilterBar(location: self.$viewModel.searchLocation)
                            .onTapGesture {
                                withAnimation(.snappy) {
                                    self.showSearchView.toggle()
                                }
                            }
                        
                        LazyVStack(spacing: 32) {
                            ForEach(self.viewModel.listings, id: \.self) { listing in
                                NavigationLink(value: listing) {
                                    ListingItemView(listing: listing)
                                        .frame(height:400)
                                        .clipShape(RoundedRectangle(cornerRadius:  10))
                                }
                            }
                        }
                        .padding()
                    }
                    .navigationDestination(for: Listing.self) { listing in
                        ListingDetailsView(listing: listing)
                            .navigationBarBackButtonHidden()
                    }
                    
                    Button(action: {
                        self.showMapView.toggle()
                    }, label: {
                        HStack{
                            Text("Map")
                            
                            Image(systemName: "paperplane")
                        }
                        .foregroundStyle(.white)
                        .padding()
                        .background(Color.black)
                        .clipShape(Capsule())
                        .padding()
                    })
                }
                .sheet( isPresented: self.$showMapView) {
                        ListingMapView(listings: self.viewModel.listings)
                    }
            }
        }
        .task {
            await self.viewModel.fetchListings()
        }
    }
}

#Preview {
    ExploreView()
}
