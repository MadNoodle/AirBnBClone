//
//  ExploreView.swift
//  AirBnBClone
//
//  Created by User on 6.1.2024.
//

import SwiftUI

struct ExploreView: View {
    // MARK: - Properties
    @StateObject private var viewModel: ExploreViewModel
    
    // MARK: - Navigation properties
    @State private var showMapView = false
    @State private var showSearchView = false
    
    // MARK: - Init
    init(service: MockExploreService) {
        self._viewModel = StateObject(wrappedValue: ExploreViewModel(service: service))
    }

    // MARK: - UI
    var body: some View {
        NavigationStack {
            if self.showSearchView {
                DestinationSearchView(
                    viewModel: self.viewModel, show: self.$showSearchView
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
    ExploreView(service: DIContainer.mock.exploreService)
}
