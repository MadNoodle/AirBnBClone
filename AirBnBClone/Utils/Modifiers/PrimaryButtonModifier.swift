//
//  PrimaryButtonModifier.swift
//  AirBnBClone
//
//  Created by User on 8.1.2024.
//

import SwiftUI

struct PrimaryButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundStyle(.white)
            .font(.subheadline)
            .fontWeight(.semibold)
            .frame(width: 360, height: 48)
            .background(.pink)
            .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

extension Button {
    func primary() -> some View {
        modifier(PrimaryButtonModifier())
    }
}
