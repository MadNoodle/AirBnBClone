//
//  CollapsedPickerView.swift
//  AirBnBClone
//
//  Created by User on 6.1.2024.
//

import SwiftUI

struct CollapsedPickerView: View {
    let title: String
    let description: String
    
    
    var body: some View {
        VStack {
            HStack {
                Text(self.title)
                    .foregroundStyle(.gray)
                
                Spacer()
                
                Text(self.description)
            }
            .fontWeight(.semibold)
            .font(.subheadline)
        }
        
    }
}
