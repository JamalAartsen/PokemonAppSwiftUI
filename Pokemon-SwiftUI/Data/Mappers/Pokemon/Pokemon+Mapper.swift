//
//  Pokemon+Mapper.swift
//  Pokemon-SwiftUI
//
//  Created by Jamal Aartsen on 02/08/2024.
//

import Foundation

extension Pokemon {
    
    static func map(_ entity: NamedAPIEntity) throws -> Pokemon {
        guard let id = entity.getId() else { throw PokeError.mapping }
        return Pokemon(
            id: id,
            name: entity.name.capitalized
        )
    }
}
