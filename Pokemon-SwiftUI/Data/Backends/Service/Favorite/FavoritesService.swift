//
//  FavoritesService.swift
//  Pokemon-SwiftUI
//
//  Created by Jamal Aartsen on 09/08/2024.
//

import Foundation

final class FavoritesService: FavoritesWorker {
    
    func getFavoritePokemons() -> [Pokemon] {
        guard let data = UserDefaults.standard.getData(forKey: .favoritePokemons) else { return [] }
        
        return decodePokemons(data: data)
    }
    
    func addFavoritePokemon(_ favorite: Pokemon) {
        var currentFavorites = getFavoritePokemons()
        if !currentFavorites.contains(where: { $0.id == favorite.id }) {
            currentFavorites.append(favorite)
            
            encodeAndAddFavoritePokemons(pokemons: currentFavorites)
        }
    }
    
    func removeFavoritePokemon(_ favorite: Pokemon) {
        var currentFavorites = getFavoritePokemons()
        if let index = currentFavorites.firstIndex(of: favorite) {
            currentFavorites.remove(at: index)
            
            encodeAndAddFavoritePokemons(pokemons: currentFavorites)
        }
    }
    
    func isFavorite(_ favorite: Pokemon) -> Bool {
        return getFavoritePokemons().contains(where: { $0.id == favorite.id })
    }
}

private extension FavoritesService {
    
    func encodeAndAddFavoritePokemons(pokemons: [Pokemon]) {
        do {
            let data = try JSONEncoder().encode(pokemons)
            UserDefaults.standard.setValue(data, forKey: .favoritePokemons)
            
        } catch let error {
            print("Unable to Encode Array of Favourite Pokemon (\(error))")
        }
    }
    
    func decodePokemons(data: Data) -> [Pokemon] {
        do {
            let favoritePokemons = try JSONDecoder().decode([Pokemon].self, from: data)
            
            return favoritePokemons
        } catch {
            return []
        }
    }
}
