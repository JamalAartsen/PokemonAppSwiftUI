//
//  Tabbar.swift
//  Pokemon-SwiftUI
//
//  Created by Jamal Aartsen on 26/07/2024.
//

import SwiftUI

struct TabBar: View {
    
    @State private var activeTab: Tab = .pokemons
    @StateObject var navigationStore = NavigationStore()
    
    var body: some View {
        NavigationStack(path: $navigationStore.path) {
            TabView(selection: $activeTab) {
                PokemonsPage()
                    .tabItem {
                        TabItem(identifier: .pokemons, activeTab: activeTab)
                    }
                    .tag(Tab.pokemons)
                
                FavoritePage()
                    .tabItem {
                        TabItem(identifier: .favorites, activeTab: activeTab)
                    }
                    .tag(Tab.favorites)
            }
            .withPageDestinations()
        }
        .tint(Color.Library.black)
    }
}
