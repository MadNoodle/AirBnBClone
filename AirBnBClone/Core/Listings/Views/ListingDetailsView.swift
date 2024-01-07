//
//  ListingDetailsView.swift
//  AirBnBClone
//
//  Created by User on 6.1.2024.
//

import SwiftUI
import MapKit

struct ListingDetailsView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State private var cameraPosition: MapCameraPosition
    
    init(listing: Listing) {
        self.listing = listing
        let region = MKCoordinateRegion(
            center:
                .init(
                    latitude: self.listing.latitude,
                    longitude: self.listing.longitude),
                                        span: 
                    .init(
                        latitudeDelta: 0.1,
                        longitudeDelta: 0.1
                    )
            )
        self._cameraPosition = State(initialValue: .region(region)
                                    )
    }
    
    let listing: Listing
    
    var body: some View {
        ScrollView {
            // images
            ZStack(alignment: .topLeading) {
                CarouselView(listing: self.listing)
                    .frame(height: 320)
                
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
            
            // Title
            VStack(alignment: .leading, spacing: 8) {
                Text(self.listing.title)
                    .font(.title)
                    .fontWeight(.semibold)
                
                VStack(alignment: .leading) {
                    HStack(spacing: 2) {
                        Image(systemName: "star.fill")
                        
                        Text("\(self.listing.rating)")
                        
                        Text(" - ")
                        Text("28 reviews")
                            .fontWeight(.semibold)
                    }
                    .foregroundStyle(.black)
                    
                    Text("\(self.listing.city), \(self.listing.state)")
                }
                .font(.caption)
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading)
            
            Divider()
            
            // Host info View
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Entire \(self.listing.type.description) hosted by \(self.listing.ownerName)")
                        .font(.headline)
                        .frame(width: 250, alignment: .leading)
                    
                    HStack(spacing: 2) {
                        Text("\(self.listing.numberOfGuests) guests - ")
                        Text("\(self.listing.numberOfBedrooms) bedrooms - ")
                        Text("\(self.listing.numberOfBeds) beds - ")
                        Text("\(self.listing.numberOfBathrooms) bath")
                    }
                    .font(.caption)
                }
                .frame(width: 300, alignment: .leading)
                
                Spacer()
                
                Image(self.listing.ownerImageURL, bundle: nil)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 64, height: 64)
                    .clipShape(Circle())
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            
            Divider()
            
            // Listing features
            
            VStack(alignment: .leading, spacing: 16){
                ForEach(self.listing.features) { feature in
                    HStack(spacing: 12) {
                        Image(systemName: feature.imageName)
                        
                        VStack(alignment: .leading) {
                            Text(feature.title)
                                .font(.footnote)
                                .fontWeight(.semibold)
                            
                            Text(feature.subtitle)
                                .font(.caption)
                                .foregroundStyle(.gray)
                            
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            
            Divider()
            
            VStack(alignment: .leading, spacing: 16) {
                Text("Where you will sleep")
                    .font(.headline)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16) {
                        ForEach(1 ..< self.listing.numberOfBedrooms, id: \.self) { bedroom in
                            VStack(alignment: .leading) {
                                Image(systemName: "bed.double")
                                
                                Text("Bedroom \(bedroom)")
                            }
                            .frame(width: 132, height: 130)
                            .overlay {
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(lineWidth: 1)
                                    .foregroundStyle(.gray)
                            }
                        }
                    }
                }
                .scrollTargetBehavior(.paging)
                
                Divider()
                
                // Listing Amenities
                VStack(alignment: .leading, spacing: 16) {
                    Text("What this place offers")
                        .font(.headline)
                    
                    ForEach(self.listing.amenities, id: \.self) { amenity in
                        HStack {
                            Image(systemName: amenity.imageName)
                                .frame(width: 32,height: 32)
                            Text(amenity.title)
                            Spacer()
                        }
                    }
                }
                
                Divider()
                
                VStack(alignment: .leading, spacing: 16) {
                    Text("Where you'll be")
                        .font(.headline)
                    
                    Map(position: self.$cameraPosition)
                        .frame(height: 200)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                }
            }
            .padding()
        }
        .toolbar(.hidden, for: .tabBar)
        .ignoresSafeArea()
        .padding(.bottom, 64)
        .overlay(alignment: .bottom) {
            VStack {
                Divider()
                    .padding(.bottom)
                HStack {
                    VStack(alignment: .leading) {
                        Text("$\(self.listing.pricePerNight)")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        
                        Text("Total before taxes")
                            .font(.footnote)
                        
                        Text("Oct 15 - 20")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .underline()
                    }
                    
                    Spacer()
                    
                    Button(action: {}, label: {
                        Text("Reserve")
                            .foregroundStyle(.white)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(width: 140, height: 40)
                            .background(.pink)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                        
                    })
                }
                .padding(.horizontal, 32)
            }
            .background(.white)
            
        }
        .ignoresSafeArea(edges: .top)
    }
}

#Preview {
    ListingDetailsView(listing: PreviewProvider.shared.listings[2])
}
