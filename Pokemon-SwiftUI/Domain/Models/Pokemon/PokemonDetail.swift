//
//  PokemonDetail.swift
//  Pokemon-SwiftUI
//
//  Created by Jamal Aartsen on 06/08/2024.
//

import Foundation

struct PokemonDetail: Identifiable, Hashable {
    let id: Int
    let types: [Types]
    let about: [KeyValueItem]
    let stats: [Stats]
    let species: [Species]
}
