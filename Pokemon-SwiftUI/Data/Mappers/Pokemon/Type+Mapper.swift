//
//  Type+Mapper.swift
//  Pokemon-SwiftUI
//
//  Created by Jamal Aartsen on 07/08/2024.
//

import Foundation

extension Types {
    
    static func mapTypes(entity: TypeEntity) throws -> Types {
        guard let id = entity.type.getId() else { throw PokeError.mapping }
        
        return .init(id: id, name: entity.type.name.capitalized)
    }
}
