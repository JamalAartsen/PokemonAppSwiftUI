//
//  PokemonsPage.swift
//  Pokemon-SwiftUI
//
//  Created by Jamal Aartsen on 26/07/2024.
//

import SwiftUI

struct PokemonsPage: View {
    
    let columns: [GridItem] = Array(repeating: .init(.flexible(), spacing: 16), count: 2)
    
    @StateObject var pokemonsStore = PokemonsStore()
    @StateObject var navigationStore = NavigationStore()
    
    @State var searchText: String = ""
    @State var isLoading: Bool = true
    
    var filteredPokemon: [Pokemon] {
        return searchText.isEmpty ? pokemonsStore.pokemons : pokemonsStore.pokemons.filter {
            $0.name.lowercased().contains(searchText.lowercased())
        }
    }
    var body: some View {
            ZStack(alignment: .topLeading) {
                Color.Library.primaryDaylight
                    .ignoresSafeArea()
                
                VStack {
                    searchFieldView(searchText: $searchText)
                    
                    if isLoading {
                        ProgressView()
                            .progressViewStyle(.circular)
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                            .scaleEffect(2)
                    } else {
                        gridView(pokemons: filteredPokemon, searchText: searchText)
                    }
                }
                .task {
                    await pokemonsStore.fetch {
                        isLoading = false
                    }
                }
            }
    }
}

extension PokemonsPage {
    
    @ViewBuilder
    func searchFieldView(searchText: Binding<String>) -> some View {
        VStack {
            HStack {
                Image(systemName: "magnifyingglass")
                TextField("Search for Pokémon..", text: $searchText)
                    .font(.system(size: 16))
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
        }
        .background(Color.Library.white)
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .padding(.horizontal, 16)
        .padding(.top, 16)
        .clipped()
    }
    
    @ViewBuilder
    func gridView(pokemons: [Pokemon], searchText: String) -> some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading) {
                
                if searchText.isEmpty {
                    Text("All Pokémon")
                        .padding(.top, 16)
                        .padding(.horizontal, 16)
                        .font(.system(size: 24, weight: .bold))
                }
                
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(pokemons, id: \.id) { pokemon in
                        PageLink(.pokemonDetail(pokemon)) {
                            PokemonCardView(pokemon: pokemon, isFavorite: pokemonsStore.isFavorite) { option in
                                pokemonsStore.handleOption(pokemon: pokemon, option: option)
                                
                            }
                            .shadow(color: Color.Library.black.opacity(0.1), radius: 10)
                        }
                    }
                }
                .padding(EdgeInsets(top: searchText.isEmpty ? 0 : 16, leading: 16, bottom: 16, trailing: 16))
            }
        }
    }
}
