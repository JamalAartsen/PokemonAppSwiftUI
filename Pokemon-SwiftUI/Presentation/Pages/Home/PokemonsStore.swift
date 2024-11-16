//
//  PokemonsStore.swift
//  Pokemon-SwiftUI
//
//  Created by Jamal Aartsen on 02/08/2024.
//

import Foundation
import Requester
import Resolver

@MainActor
final class PokemonsStore: ObservableObject {
    
    @Published var pokemons: [Pokemon] = []
    
    @Injected private var requester: APIRequesting
    @Injected private var favoriteWorker: FavoritesWorker
    
    @Published var isFavorite: Bool = false
}

extension PokemonsStore {
    
    func fetch(completion: @escaping () -> Void) async {
        do {
            let response = try await self.requester.perform(GetAllPokemonAPIRequest())
            let pokemons = response.results.compactMap { result in
                try? Pokemon.map(result)
            }
            
            self.pokemons = pokemons
            completion()
        } catch let error {
            print("Error fetching Pokémon: \(error.localizedDescription)")
            completion()
        }
    }
}

// MARK: - Favorite
extension PokemonsStore {
    
    func handleOption(pokemon: Pokemon, option: OptionType) {
        switch option {
        case .open:
            break
        case .favorite:
            if !favoriteWorker.isFavorite(pokemon) {
                print("💯 Toevoegen")
                favoriteWorker.addFavoritePokemon(pokemon)
                isFavorite = true
            } else {
                print("💯 Weghalen")
                favoriteWorker.removeFavoritePokemon(pokemon)
                isFavorite = false
            }
        case .share:
            break
        }
    }
    
    func isPokemonFavorite(pokemon: Pokemon) -> Bool {
        return favoriteWorker.isFavorite(pokemon)
    }
}
