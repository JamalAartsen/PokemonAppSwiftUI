//
//  PokemonDetailEntity.swift
//  Pokemon-SwiftUI
//
//  Created by Jamal Aartsen on 02/08/2024.
//

import Foundation

struct PokemonDetailEntity: Codable {
    let id: Int
    let name: String
    let base_experience: Int
    let weight: Int
    let height: Int
    let types: [TypeEntity]
    let abilities: [AbilityEntity]
    let stats: [StatsEntity]
    let species: NamedAPIEntity
}
