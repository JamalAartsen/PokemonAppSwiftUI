//
//  GetPokemonDetailEntity.swift
//  Pokemon-SwiftUI
//
//  Created by Jamal Aartsen on 02/08/2024.
//

import Foundation
import Requester

enum PokemonIdentifier {
    case id(Int)
    case name(String)
}

struct GetPokemonDetailAPIRequest: APIRequest {
    
    typealias Response = PokemonDetailEntity
    
    var backend: Backend { .pokeAPI }
    var path: String {
        switch identifier {
        case .id(let id):
            return "v2/pokemon/\(id)"
        case .name(let name):
            return "v2/pokemon/\(name)"
        }
    }
    var method: APIMethod { .get }
    
    let identifier: PokemonIdentifier
    
    init(identifier: PokemonIdentifier) {
        self.identifier = identifier
    }
}


//struct GetPokemonDetailAPIRequest: APIRequest {
//    
//    typealias Response = PokemonDetailEntity
//    
//    var backend: Backend { .pokeAPI }
//    var path: String { "v2/pokemon/\(id)" }
//    var method: APIMethod { .get }
//    
//    let id: Pokemon.ID
//}
