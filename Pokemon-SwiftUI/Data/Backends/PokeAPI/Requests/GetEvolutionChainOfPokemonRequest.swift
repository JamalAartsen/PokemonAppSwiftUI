//
//  GetEvolutionChainOfPokemonRequest.swift
//  Pokemon-SwiftUI
//
//  Created by Jamal Aartsen on 09/08/2024.
//

import Foundation
import Requester

struct GetEvolutionChainOfPokemonRequest: APIRequest {
    
    typealias Response = ChainEntity
    
    var backend: Backend { .pokeAPI }
    var path: String { "v2/evolution-chain/\(id)" }
    var method: APIMethod { .get }
    
    let id: Pokemon.ID
}
