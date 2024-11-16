//
//  PokemonDetail+Mapper.swift
//  Pokemon-SwiftUI
//
//  Created by Jamal Aartsen on 06/08/2024.
//

import Foundation

extension PokemonDetail {
    
    static func map(_ entity: PokemonDetailEntity, species: [Species]) throws -> PokemonDetail {
        let types = entity.types.compactMap { try? Types.mapTypes(entity: $0) }
        let abilities = entity.abilities.compactMap { try? Ability.mapAbilities(entity: $0) }
        let stats = entity.stats.compactMap { try? Stats.mapStats(entity: $0) }
        
        return .init(
            id: entity.id,
            types: types,
            about: [
                .init(key: "Name", value: entity.name.capitalized),
                .init(key: "ID", value: String(format: "%03d", entity.id)),
                .init(key: "Base", value: "\(entity.base_experience) XP"),
                .init(key: "Weight", value: "\(entity.weight)"),
                .init(key: "Height", value: "\(entity.height)"),
                .init(key: "Types", value: types.map { $0.name }.joined(separator: ", ")),
                .init(key: "Abilities", value: abilities.map { $0.name }.joined(separator: ", "))
            ],
            stats: stats,
            species: species
        )
    }
}
