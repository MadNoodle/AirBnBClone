//
//  ProfileOptionRowView.swift
//  AirBnBClone
//
//  Created by User on 6.1.2024.
//

import SwiftUI

struct ProfileOptionRowView: View {
    
    let imageName: String
    let title: String
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: self.imageName)
                
                Text(self.title)
                    .font(.subheadline)
                
                Spacer()
                
                Image(systemName: "chevron.right")
                
            }
            
            Divider()
        }
    }
}
