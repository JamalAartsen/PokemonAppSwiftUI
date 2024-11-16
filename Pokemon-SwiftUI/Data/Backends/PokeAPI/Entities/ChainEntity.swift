//
//  ChainEntity.swift
//  Pokemon-SwiftUI
//
//  Created by Jamal Aartsen on 09/08/2024.
//

import Foundation

struct ChainEntity: Codable, Equatable {
    let chain: EvolvesToEntity
}

struct EvolvesToEntity: Codable, Equatable {
    let species: NamedAPIEntity
    let evolves_to: [EvolvesToEntity]
}
