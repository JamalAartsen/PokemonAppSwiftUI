//
//  FavoritePage.swift
//  Pokemon-SwiftUI
//
//  Created by Jamal Aartsen on 08/08/2024.
//

import SwiftUI
import Foundation

struct FavoritePage: View {
    
    let columns: [GridItem] = Array(repeating: .init(.flexible(), spacing: 16), count: 2)
    
    @StateObject var favoriteStore = FavoriteStore()
    
    var body: some View {
        ZStack {
            Color.Library.primaryDaylight
                .ignoresSafeArea()
            
            VStack {
                gridView(pokemons: favoriteStore.pokemons)
            }
            .task {
                favoriteStore.fetch()
            }
        }
    }
}

extension FavoritePage {
    
    @ViewBuilder
    func gridView(pokemons: [Pokemon]) -> some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading) {
                Text("My favorites")
                    .padding(.top, 16)
                    .padding(.horizontal, 16)
                    .font(.system(size: 24, weight: .bold))
                
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(pokemons, id: \.id) { pokemon in
                        PageLink(.pokemonDetail(pokemon)) {
                            PokemonCardView(pokemon: pokemon, isFavorite: true) { option in
                                
                            }
                            .shadow(color: Color.Library.black.opacity(0.1), radius: 10)
                        }
                    }
                }
                .padding(EdgeInsets(top: 0, leading: 16, bottom: 16, trailing: 16))
            }
        }
    }
}
