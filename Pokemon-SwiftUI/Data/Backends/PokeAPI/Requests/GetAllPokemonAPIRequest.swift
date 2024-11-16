//
//  GetAllPokemonAPIRequest.swift
//  Pokemon-SwiftUI
//
//  Created by Jamal Aartsen on 02/08/2024.
//

import Foundation
import Requester

struct GetAllPokemonAPIRequest: APIRequest {
    
    typealias Response = NamedAPIListEntity
    
    var backend: Backend { .pokeAPI }
    var path: String { "v2/pokemon" }
    var method: APIMethod { .get }
    var parameters: [String: Any] { [
        "limit": 151
    ] }
}
