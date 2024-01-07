//
//  DeveloperPreview.swift
//  AirBnBClone
//
//  Created by User on 7.1.2024.
//

import Foundation

class PreviewProvider {
    
    static let shared = PreviewProvider()
    
    private init() {}
    
    var listings: [Listing] = [
        .init(
            id: NSUUID().uuidString,
            ownerUserId: NSUUID().uuidString,
            ownerName: "John Smith",
            ownerImageURL: "male",
            numberOfBedrooms: 4,
            numberOfBeds: 4,
            numberOfBathrooms: 3,
            numberOfGuests: 4,
            pricePerNight: 567,
            latitude: 25.7706,
            longitude: -80.1340,
            imageURLs: ["listing-4", "listing-3", "listing-4"],
            city: "Miami",
            address: "124 Main St",
            state: "Florida",
            title: "Miami Beach House",
            rating: 4.0,
            features: [.selfCheckIn, .superhost],
            amenities: [.wifi, .alarmSystem, .tv, .kitchen, .office],
            type: .house
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUserId: NSUUID().uuidString,
            ownerName: "Steve Johnson",
            ownerImageURL: "male",
            numberOfBedrooms: 4,
            numberOfBeds: 4,
            numberOfBathrooms: 3,
            numberOfGuests: 4,
            pricePerNight: 763,
            latitude: 25.7650,
            longitude: -80.1936,
            imageURLs: ["listing-1", "listing-3", "listing-4"],
            city: "Miami",
            address: "124 Main St",
            state: "Florida",
            title: "Beatiful Miami apartment in downtown Brickell",
            rating: 4.0,
            features: [.selfCheckIn, .superhost],
            amenities: [.wifi, .alarmSystem, .balcony],
            type: .apartment
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUserId: NSUUID().uuidString,
            ownerName: "Harry Styles",
            ownerImageURL: "male",
            numberOfBedrooms: 4,
            numberOfBeds: 4,
            numberOfBathrooms: 3,
            numberOfGuests: 4,
            pricePerNight: 763,
            latitude: 34.2,
            longitude: -118.0426,
            imageURLs: ["listing-2", "listing-3", "listing-4"],
            city: "Los Angeles",
            address: "124 Main St",
            state: "California",
            title: "Beatiful Los Angeles home in Malibu",
            rating: 4.0,
            features: [.selfCheckIn, .superhost],
            amenities: [.wifi, .alarmSystem, .pool],
            type: .apartment
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUserId: NSUUID().uuidString,
            ownerName: "Timothy Chalamet",
            ownerImageURL: "male",
            numberOfBedrooms: 4,
            numberOfBeds: 4,
            numberOfBathrooms: 3,
            numberOfGuests: 4,
            pricePerNight: 780,
            latitude: 34.1,
            longitude: -118.1426,
            imageURLs: ["listing-3", "listing-1", "listing-4"],
            city: "Los Angeles",
            address: "124 Main St",
            state: "California",
            title: "Beatiful Los Angeles home in the Hollywood Hills",
            rating: 4.2,
            features: [.selfCheckIn, .superhost],
            amenities: [.wifi, .alarmSystem, .balcony],
            type: .apartment
        ),
    ]
    
//    let user = User(accountType: .guest, fullname: "John Doe", email: "johndoe@gmail.com", profileImageURL: "male-profile-photo")
}
