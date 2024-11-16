//
//  Tab.swift
//  Pokemon-SwiftUI
//
//  Created by Jamal Aartsen on 26/07/2024.
//

import SwiftUI

enum Tab: Int, Hashable {
    
    case pokemons, favorites
    
    var image: Image {
        switch self {
        case .pokemons:
            Image("pokemon.ball")
        case .favorites:
            Image("favorite")
        }
    }
    
    var activeImage: Image {
        switch self {
        case .pokemons:
            Image("pokemon.ball.fill")
        case .favorites:
            Image("favorite.fill")
        }
    }
    
    var name: String {
        switch self {
        case .pokemons:
            "Pokémons"
        case .favorites:
            "Favorites"
        }
    }
}
