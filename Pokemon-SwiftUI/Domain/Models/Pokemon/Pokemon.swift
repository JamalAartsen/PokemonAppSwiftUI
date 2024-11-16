//
//  Pokemon.swift
//  Pokemon-SwiftUI
//
//  Created by Jamal Aartsen on 02/08/2024.
//

import Foundation

struct Pokemon: Identifiable, Hashable, Codable {
    let id: Int
    let name: String
}

extension Pokemon {
    
    var image: URL? {
        URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/\(id).png")
    }
    
    var sprite: URL? {
        URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(id).png")
    }
}
