//
//  FavoriteStore.swift
//  Pokemon-SwiftUI
//
//  Created by Jamal Aartsen on 09/08/2024.
//

import Foundation
import Resolver

@MainActor
final class FavoriteStore: ObservableObject {
    
    @Published var pokemons: [Pokemon] = []
    
    @Injected private var favoritesManager: FavoritesWorker
    
    @Published var currentOption: OptionType {
        didSet {
            processOption(type: currentOption)
        }
    }
    
    init() {
        currentOption = .open
    }
}

extension FavoriteStore {
    
    func fetch() {
        pokemons = favoritesManager.getFavoritePokemons()
    }
    
    func processOption(type: OptionType) {
        switch type {
        case .open:
            print("💯 open")
        case .favorite:
            print("💯 favorite")
        case .share:
            print("💯 share")
        }
    }
}
