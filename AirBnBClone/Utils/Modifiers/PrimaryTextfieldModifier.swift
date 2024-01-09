//
//  PrimaryTextfieldModifier.swift
//  AirBnBClone
//
//  Created by User on 8.1.2024.
//

import SwiftUI

/// Modifier styling a textfield with a grey background and rounded corners
struct PrimaryTextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .padding(12)
            .background(Color(.systemGray6))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding(.horizontal, 24)
    }
}

// MARK: View Extension
extension View {
    func primaryStyle() -> some View {
        modifier(PrimaryTextFieldModifier())
    }
}
