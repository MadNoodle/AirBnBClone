//
//  ListingMapView.swift
//  AirBnBClone
//
//  Created by User on 7.1.2024.
//

import SwiftUI
import MapKit

struct ListingMapView: View {
    
    // MARK: - Data properties
    private let listings: [Listing]
    @State private var selectedListing: Listing?
    
    // MARK: - NavigationProperties
    @Environment(\.dismiss) var dismiss
    @State private var showListingDetails = false
    
    // MARK: - Map properties
    @State private var cameraPosition: MapCameraPosition
    
    // MARK: - Init
    init(listings: [Listing], center: CLLocationCoordinate2D = .losAngeles) {
        self.listings = listings
        let visibleArea = MKCoordinateRegion(
            center:  center,
            latitudinalMeters: 50_000,
            longitudinalMeters: 50_000
        )
        self._cameraPosition = State(initialValue: .region(visibleArea))
    }
    
    // MARK: - UI
    var body: some View {
        ZStack(alignment: .topLeading) {
            ZStack(alignment: .bottom) {
                Map(position: self.$cameraPosition, selection: self.$selectedListing) {
                    ForEach(self.listings, id: \.self) { listing in
                        Marker("", coordinate: listing.coordinates)
                            .tag(listing.id)
                    }
                }
                
                if let selectedItem = self.selectedListing {
                    withAnimation(.spring) {
                        ListingMapPreviewView(listing: selectedItem)
                            .onTapGesture {
                                self.showListingDetails.toggle()
                            }
                    }
                }
            }
            
            Button(action: {
                self.dismiss()
            }, label: {
                Image(systemName: "chevron.left")
                    .foregroundStyle(.black)
                    .background(
                        Circle()
                        .fill(.white)
                        .frame(width: 32, height: 32)
                    )
                    .padding(.vertical, 48)
                    .padding(.horizontal, 32)
            })
            
            
        }
        .fullScreenCover(isPresented: self.$showListingDetails) {
            if let selectedItem = self.selectedListing {
                ListingDetailsView(listing: selectedItem)
            }
        }
    }
}

#Preview {
    ListingMapView(listings: PreviewProvider.shared.listings)
}
