//
//  PokemonDetailWorker.swift
//  Pokemon-SwiftUI
//
//  Created by Jamal Aartsen on 14/08/2024.
//

import Foundation

protocol PokemonDetailWorker: AnyObject {
    func getDetailOfPokemon(id: Int) async -> PokemonDetail?
}
