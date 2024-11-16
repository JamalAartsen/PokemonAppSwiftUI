//
//  PokemonDetailStore.swift
//  Pokemon-SwiftUI
//
//  Created by Jamal Aartsen on 06/08/2024.
//

import Foundation
import Requester
import Resolver

@MainActor
final class PokemonDetailStore: ObservableObject {
    
    @Published var pokemonDetail: PokemonDetail?
    @Published var isFavorite: Bool = false
    
    @Injected private var requester: APIRequesting
    @Injected private var favoritesService: FavoritesWorker
    @Injected private var pokemonDetailService: PokemonDetailWorker
    
    init(pokemonDetail: PokemonDetail? = nil) {
        self.pokemonDetail = pokemonDetail
    }
}

// MARK: - Requests
extension PokemonDetailStore {
    
    func getPokemonDetail(pokemon: Pokemon) async {
        let pokemonDetail = await pokemonDetailService.getDetailOfPokemon(id: pokemon.id)
        
        self.pokemonDetail = pokemonDetail
    }
}

// MARK: - Favorite
extension PokemonDetailStore {
    
    func toggleFavorite(pokemon: Pokemon) {
        if isFavorite {
            favoritesService.removeFavoritePokemon(pokemon)
        } else {
            favoritesService.addFavoritePokemon(pokemon)
        }
        isFavorite(pokemon: pokemon)
    }
    
    func isFavorite(pokemon: Pokemon) {
        isFavorite = favoritesService.isFavorite(pokemon)
    }
}
