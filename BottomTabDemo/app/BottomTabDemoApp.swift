//
//  BottomTabDemoApp.swift
//  BottomTabDemo
//
//  Created by Md Altaf Hoshain Firoj on 28/8/24.
//

import SwiftUI

@main
struct BottomTabDemoApp: App {
    
    @StateObject private var navState = NavState()
    @StateObject private var loginViewModel = LoginViewModel()
    @StateObject private var networkMonitor = NetworkMonitor()
    
    init() {
        // Configure the appearance of navigation bar globally
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor.purple.withAlphaComponent(0.2) // Custom background color
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black] // Title text color
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black] // Large title text color
        
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(navState)
                .environmentObject(loginViewModel)
                .environmentObject(networkMonitor)
        }
    }
}
