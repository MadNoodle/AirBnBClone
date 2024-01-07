//
//  Listing.swift
//  AirBnBClone
//
//  Created by User on 7.1.2024.
//

import Foundation
import CoreLocation

struct Listing: Identifiable, Codable, Hashable {
    let id: String
    let ownerUserId: String
    let ownerName: String
    let ownerImageURL: String
    let numberOfBedrooms: Int
    let numberOfBeds: Int
    let numberOfBathrooms: Int
    let numberOfGuests: Int
    var pricePerNight: Int
    let latitude: Double
    let longitude: Double
    var imageURLs: [String]
    let city: String
    let address: String
    let state: String
    let title: String
    var rating: Double
    var features: [ListingFeatures]
    var amenities: [ListingAmenities]
    let type: ListingType
    
    var coordinates: CLLocationCoordinate2D {
        return .init(latitude: self.latitude, longitude: self.longitude)
    }
}

enum ListingFeatures: Int, Codable, Identifiable, Hashable {
    case selfCheckIn
    case superhost
    
    var id: Int { return self.rawValue }
    
    var imageName: String {
        switch self {
        case .selfCheckIn: return "door.left.hand.open"
        case .superhost: return "medal"
        }
    }
    
    var title: String {
        switch self {
        case .selfCheckIn: return "Self check-in"
        case .superhost: return "Superhost"
        }
    }
    
    var subtitle: String {
        switch self {
        case .selfCheckIn: 
            return "Check yourself in with the keypad"
        case .superhost: 
            return "Superhosts are experienced, highly rated hosts who are commited to providing greats stars for guests"
        }
    }
}

enum ListingAmenities: Int, Codable, Identifiable, Hashable {
    case pool
    case kitchen
    case wifi
    case laundry
    case tv
    case alarmSystem
    case office
    case balcony
    
    var id: Int { return self.rawValue }
    
    var title: String {
        switch self {
        case .pool : return "Pool"
        case .kitchen : return "Kitchen"
        case .wifi : return "Wifi"
        case .laundry : return "Laundry"
        case .tv : return "TV"
        case .alarmSystem : return "Alarm System"
        case .office : return "Office"
        case .balcony : return "Balcony"
        }
    }
    
    var imageName: String {
        switch self {
        case .pool : return "figure.pool.swim"
        case .kitchen : return "fork.knife"
        case .wifi : return "wifi"
        case .laundry : return "washer"
        case .tv : return "tv"
        case .alarmSystem : return "checkerboard.shield"
        case .office : return "pencil.and.ruler.fill"
        case .balcony : return "building"
        }
    }
}

enum ListingType: Int, Codable, Identifiable, Hashable {
    case apartment
    case house
    case townHouse
    case villa
    
    var description: String {
        switch self {
        case .apartment: return "Apartment"
        case .house: return "House"
        case .townHouse: return "Town Home"
        case .villa: return "Villa"
        }
    }
    
    var id: Int { return self.rawValue }
}
