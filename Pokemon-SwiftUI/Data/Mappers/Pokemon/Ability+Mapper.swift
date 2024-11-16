//
//  Ability+Mapper.swift
//  Pokemon-SwiftUI
//
//  Created by Jamal Aartsen on 07/08/2024.
//

import Foundation

extension Ability {
    
    static func mapAbilities(entity: AbilityEntity) throws -> Ability {
        guard let id = entity.ability.getId() else { throw PokeError.mapping }
        
        return .init(id: id, name: entity.ability.name.capitalized)
    }
}
