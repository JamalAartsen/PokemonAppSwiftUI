//
//  PokemonDetailPage.swift
//  Pokemon-SwiftUI
//
//  Created by Jamal Aartsen on 02/08/2024.
//

import SwiftUI

struct PokemonDetailPage: View {
    
    let pokemon: Pokemon
    
    @StateObject var pokemonDetailStore = PokemonDetailStore()
    
    @State private var isFavorite: Bool = false
    
    init(pokemon: Pokemon) {
        self.pokemon = pokemon
        
        let appearance = UINavigationBarAppearance()
        
        appearance.backgroundColor = UIColor.daylight
        appearance.shadowColor = .clear
        
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        
        UIScrollView.appearance().bounces = false
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .topLeading) {
                Color.Library.primaryDaylight
                    .ignoresSafeArea()
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 0) {
                        // Header
                        VStack(alignment: .leading) {
                            PokemonDetailHeaderView(pokemon: pokemon)
                            
                            // Tags
                            TagsView(tags: pokemonDetailStore.pokemonDetail?.types ?? [])
                            
                            // Image
                            URLImage(pokemon.image)
                                .padding(.bottom, -75)
                                .padding(.horizontal, 75)
                        }
                        .zIndex(1)
                        .background(Color.Library.primaryDaylight)
                        
                        CustomSegmentedControl(
                            textPadding: 10,
                            horizontalPadding: 24,
                            verticalPadding: 24,
                            parentWidth: geometry.size.width,
                            items: [
                                .init(id: 0, name: "About", content: AboutView(about: pokemonDetailStore.pokemonDetail?.about ?? [])),
                                .init(id: 1, name: "Stats", content: StatsView(stats: pokemonDetailStore.pokemonDetail?.stats ?? [])),
                                .init(id: 2, name: "Evolution", content: EvolutionView(species: pokemonDetailStore.pokemonDetail?.species ?? []))
                            ]
                        )
                        .padding(.top, 75)
                    }
                }
                .background(Color.Library.white)
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        pokemonDetailStore.toggleFavorite(pokemon: pokemon)
                    } label: {
                        Image(systemName: pokemonDetailStore.isFavorite ? "heart.fill" : "heart")
                            .foregroundStyle(pokemonDetailStore.isFavorite ? .red : Color.Library.primaryMidnight)
                    }
                }
            }
            .task {
                await pokemonDetailStore.getPokemonDetail(pokemon: pokemon)
                pokemonDetailStore.isFavorite(pokemon: pokemon)
            }
        }
    }
}
