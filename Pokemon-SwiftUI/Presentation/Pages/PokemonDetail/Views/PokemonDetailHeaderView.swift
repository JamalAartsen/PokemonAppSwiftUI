//
//  PokemonDetailHeaderView.swift
//  Pokemon-SwiftUI
//
//  Created by Jamal Aartsen on 05/08/2024.
//

import SwiftUI

struct PokemonDetailHeaderView: View {
    
    let pokemon: Pokemon
    
    var body: some View {
        HStack {
            Text(pokemon.name)
                .foregroundStyle(Color.Library.primaryMidnight)
                .font(.system(size: 32, weight: .bold))
            
            Spacer()
            
            Text("#\(String(format: "%03d", pokemon.id))")
                .foregroundStyle(Color.Library.primaryMidnight.opacity(0.3))
                .font(.system(size: 24, weight: .regular))
        }
        .padding(.horizontal, 24)
        .padding(.top, 24)
    }
}
