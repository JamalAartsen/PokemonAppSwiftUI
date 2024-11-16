//
//  PokeAPIBackend.swift
//  Pokemon-SwiftUI
//
//  Created by Jamal Aartsen on 02/08/2024.
//

import Foundation
import Requester

struct PokeAPIBackend: Backend {
    
    var baseURL: URL { URL(string: "https://pokeapi.co/api")! }
}

extension Backend where Self == PokeAPIBackend {
    static var pokeAPI: Self { return PokeAPIBackend() }
}
