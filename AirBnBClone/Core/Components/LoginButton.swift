//
//  LoginButton.swift
//  AirBnBClone
//
//  Created by User on 8.1.2024.
//

import SwiftUI

struct LogInButton: View {
    // MARK: - Properties
    let action: () -> Void
    
    // MARK: - UI
    var body: some View {
        Button {
            self.action()
        } label: {
            Text("Log in")
                
        }
        .primary()

    }
}
