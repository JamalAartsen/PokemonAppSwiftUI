//
//  View+Extension.swift
//  Pokemon-SwiftUI
//
//  Created by Jamal Aartsen on 02/08/2024.
//

import Foundation
import SwiftUI

extension View {
    
    @ViewBuilder
    func withPageDestinations() -> some View {
        self.navigationDestination(for: Page.self) { destination in
            switch destination {
            case .pokemonDetail(let pokemonDetail):
                PokemonDetailPage(pokemon: pokemonDetail)
            }
        }
    }
}
