//
//  AirBnBCloneApp.swift
//  AirBnBClone
//
//  Created by User on 6.1.2024.
//

import SwiftUI

@main
struct AirBnBCloneApp: App {
    
    //MARK: - Dependencies
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    private let dependencies: DIContainer = .live
    
    // MARK:  - UI
    var body: some Scene {
        WindowGroup {
            MainTabView(dependencies: self.dependencies)
        }
    }
}
