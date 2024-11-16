//
//  ContentView.swift
//  Pokemon-SwiftUI
//
//  Created by Jamal Aartsen on 26/07/2024.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var navigationStore = NavigationStore()
    
    init() {
        // set the tint colours for tabbar items
        let itemAppearance = UITabBarItemAppearance()
        itemAppearance.normal.iconColor = UIColor.midnight
        itemAppearance.selected.iconColor = UIColor.primaryPurple

        itemAppearance.normal.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.midnight
        ]
        itemAppearance.selected.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.primaryPurple
        ]

        let standardAppearance = UITabBarAppearance()
        standardAppearance.inlineLayoutAppearance = itemAppearance
        standardAppearance.stackedLayoutAppearance = itemAppearance
        standardAppearance.compactInlineLayoutAppearance = itemAppearance
    
        UITabBar.appearance().standardAppearance = standardAppearance
    }
    
    var body: some View {
        ZStack {
            TabBar()
        }
        .environmentObject(navigationStore)
    }
}

#Preview {
    ContentView()
}
