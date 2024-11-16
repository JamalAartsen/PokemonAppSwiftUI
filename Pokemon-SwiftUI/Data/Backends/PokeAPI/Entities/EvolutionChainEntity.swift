//
//  EvolutionChainEntity.swift
//  Pokemon-SwiftUI
//
//  Created by Jamal Aartsen on 09/08/2024.
//

import Foundation

struct EvolutionChainEntity: Codable {
    let evolution_chain: URLEntity
}

struct URLEntity: Codable {
    let url: URL
}

extension URLEntity {
    
    func getId() -> Int? {
        guard let idString = url.pathComponents.last,
              let id = Int(idString) else {
            return nil
        }
        return id
    }
}
