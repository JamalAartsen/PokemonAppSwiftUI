//
//  Dependencies.swift
//  Pokemon-SwiftUI
//
//  Created by Jamal Aartsen on 02/08/2024.
//

import Foundation
import Resolver
import Requester

enum Dependencies {
    
    static func register() {
        Resolver.main.register {
            APIRequester.default
        }
        .implements(APIRequesting.self)
        .scope(.application)
        
        Resolver.main.register {
            FavoritesService() as FavoritesWorker
        }
        .scope(.application)
        
        Resolver.main.register {
            PokemonDetailService() as PokemonDetailWorker
        }
    }
}
