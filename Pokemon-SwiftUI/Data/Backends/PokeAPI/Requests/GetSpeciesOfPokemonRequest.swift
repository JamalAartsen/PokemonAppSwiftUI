//
//  GetSpeciesOfPokemonRequest.swift
//  Pokemon-SwiftUI
//
//  Created by Jamal Aartsen on 09/08/2024.
//

import Foundation
import Requester

struct GetSpeciesOfPokemonRequest: APIRequest {
    
    typealias Response = EvolutionChainEntity
    
    var backend: Backend { .pokeAPI }
    var path: String { "v2/pokemon-species/\(id)" }
    var method: APIMethod { .get }
    
    let id: Pokemon.ID
}
