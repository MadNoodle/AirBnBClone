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
    
    var body: some View {
        ScrollView {
            // images
            ZStack(alignment: .topLeading) {
                CarouselView()
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
                Text("Miami Villa")
                    .font(.title)
                    .fontWeight(.semibold)
                
                VStack(alignment: .leading) {
                    HStack(spacing: 2) {
                        Image(systemName: "star.fill")
                        
                        Text("4.08")
                        
                        Text(" - ")
                        Text("28 reviews")
                            .fontWeight(.semibold)
                    }
                    .foregroundStyle(.black)
                    
                    Text("Miami, Florida")
                }
                .font(.caption)
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading)
            
            Divider()
            
            // Host info View
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Entire villa hosted by john Smith")
                        .font(.headline)
                        .frame(width: 250, alignment: .leading)
                    
                    HStack(spacing: 2) {
                        Text("4 guests - ")
                        Text("4 bedrooms - ")
                        Text("4 beds - ")
                        Text("3 bath")
                    }
                    .font(.caption)
                }
                .frame(width: 300, alignment: .leading)
                
                Spacer()
                
                Image("male", bundle: nil)
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
                ForEach(0..<2) { feature in
                    HStack(spacing: 12) {
                        Image(systemName: "medal")
                        
                        VStack(alignment: .leading) {
                            Text("SuperHost")
                                .font(.footnote)
                                .fontWeight(.semibold)
                            
                            Text("Superhosts are experience, highly rated hosts who are commited to providing great stars for guests")
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
                        ForEach(1..<5) { bedroom in
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
                
                // Lisiting Amenities
                VStack(alignment: .leading, spacing: 16) {
                    Text("What this place offers")
                        .font(.headline)
                    
                    ForEach(0..<5) { feature in
                        HStack {
                            Image(systemName: "wifi")
                                .frame(width: 32,height: 32)
                            Text("Wifi")
                            Spacer()
                        }
                    }
                }
                
                Divider()
                
                VStack(alignment: .leading, spacing: 16) {
                    Text("Where you'll be")
                        .font(.headline)
                    
                    Map()
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
                        Text("$500")
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
    ListingDetailsView()
}
