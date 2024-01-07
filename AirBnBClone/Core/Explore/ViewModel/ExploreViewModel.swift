//
//  ExploreViewModel.swift
//  AirBnBClone
//
//  Created by User on 7.1.2024.
//

import Foundation

class ExploreViewModel: ObservableObject {
    @Published var listings = [Listing]()
    @Published var searchLocation = ""
    
    private let service: ExploreService
    
    private var listingCopy = [Listing]()
    
    init(service: ExploreService) {
        self.service = service
    }
    
    @MainActor
    func fetchListings() async {
        do {
            self.listings = try await self.service.fetchService()
            self.listingCopy = self.listings
        } catch {
            print("Error while fetching listings")
        }
    }
    
    func updateListing() {
        let filteredListings = self.listings.filter {
            $0.city.lowercased() == self.searchLocation.lowercased() ||
            $0.state.lowercased() == self.searchLocation.lowercased()
        }
        
        self.listings = filteredListings.isEmpty ? self.listingCopy : filteredListings
    }
    
}
