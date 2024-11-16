//
//  FavoritesWorker.swift
//  Pokemon-SwiftUI
//
//  Created by Jamal Aartsen on 09/08/2024.
//

import Foundation

protocol FavoritesWorker: AnyObject {
    func getFavoritePokemons() -> [Pokemon]
    func addFavoritePokemon(_ favorite: Pokemon)
    func removeFavoritePokemon(_ favorite: Pokemon)
    func isFavorite(_ favorite: Pokemon) -> Bool
}
