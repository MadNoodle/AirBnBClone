//
//  CollapsablePickerViewModifier.swift
//  AirBnBClone
//
//  Created by User on 8.1.2024.
//

import SwiftUI

struct CollapsableDestinationViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .shadow(radius: 10)
    }
}

extension View {
    func collapsable() -> some View {
        modifier(CollapsableDestinationViewModifier())
    }
}
