//
//  Stats+Mapper.swift
//  Pokemon-SwiftUI
//
//  Created by Jamal Aartsen on 07/08/2024.
//

import Foundation

extension Stats {
    
    static func mapStats(entity: StatsEntity) throws -> Stats {
        guard let id = entity.stat.getId() else { throw PokeError.mapping }
        
        let name: String
        if entity.stat.name == "hp" {
            name = entity.stat.name.uppercased()
        } else {
            name = entity.stat.name.capitalized
        }
        
        return .init(
            id: id,
            name: name,
            base: entity.base_stat
        )
    }
}
