//
//  EvolutionView.swift
//  Pokemon-SwiftUI
//
//  Created by Jamal Aartsen on 06/08/2024.
//

import SwiftUI

struct EvolutionView: View {
    
    let species: [Species]
    
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(Array(species.enumerated()), id: \.element.id) { index, kind in
                evolutionItemCardView(kind: kind)
                
                if index < species.count - 1 {
                    Image("dots")
                        .padding(.leading, 40)
                        .opacity(0.3)
                }
            }
        }
    }
}

private extension EvolutionView {
    
    @ViewBuilder
    func evolutionItemCardView(kind: Species) -> some View {
        HStack {
            URLImage(URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(kind.id).png"))
                .frame(width: 80, height: 80)
                .background(Color.Library.pokecardBackground)
            
            VStack(alignment: .leading) {
                IDCardView(id: kind.id)
                Text(kind.name.capitalized)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.Library.white)
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .shadow(color: Color.Library.black.opacity(0.1), radius: 10)
    }
}
