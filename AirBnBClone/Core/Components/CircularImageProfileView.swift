//
//  CircularImageProfileView.swift
//  AirBnBClone
//
//  Created by User on 9.1.2024.
//

import SwiftUI

enum ProfileImageSize {
    case xxSmall
    case xSmall
    case small
    case medium
    case large
    case xLarge
    
    var dimensions: CGFloat {
        switch self {
        case .xxSmall: return 28
        case .xSmall: return 32
        case .small: return 40
        case .medium: return 48
        case .large: return 64
        case .xLarge: return 80
        }
    }
}

struct CircularImageProfileView: View {
    
    var imageURL: String?
    let size: ProfileImageSize

    var body: some View {
        if let imageURL {
            Image(imageURL)
                .resizable()
                .scaledToFill()
                .frame(width: self.size.dimensions, height: self.size.dimensions)
                .clipShape(Circle())
        } else {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: self.size.dimensions, height: self.size.dimensions)
                .foregroundColor(Color(.systemGray5))
                .clipShape(Circle())
        }
    }
}

#Preview {
    CircularImageProfileView(size: .medium)
}
