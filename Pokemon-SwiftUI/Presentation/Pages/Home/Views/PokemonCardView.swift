//
//  PokemonCardView.swift
//  Pokemon-SwiftUI
//
//  Created by Jamal Aartsen on 01/08/2024.
//

import SwiftUI

enum OptionType {
    case open
    case favorite
    case share
}

struct PopOverOptionItem {
    let id: Int
    let icon: String
    let name: String
    let optionType: OptionType
}

struct PokemonCardView: View {
    
    let pokemon: Pokemon
    
    @State private var isShowingPopover = false
    
    let isFavorite: Bool
    var onOptionSelected: (OptionType) -> Void
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                IDCardView(id: pokemon.id)
                
                URLImage(pokemon.sprite)
            }
            .padding(14)
            
            bottomView(name: pokemon.name, isShowingPopover: $isShowingPopover)
        }
        .background(Color.Library.pokecardBackground)
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

extension PokemonCardView {
    
    @ViewBuilder
    func bottomView(name: String, isShowingPopover: Binding<Bool>) -> some View {
        HStack {
            Text(name)
                .font(.system(size: 19))
                .fontWeight(.medium)
                .lineLimit(1)
                .foregroundStyle(Color.Library.black)
            
            Spacer()
            
            Button {
                self.isShowingPopover = true
            } label: {
                Image("three-dots")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 15)
            }
            .confirmationDialog("", isPresented: $isShowingPopover) {
                PageLink(.pokemonDetail(pokemon)) {
                    Text("Open Pokémon")
                }
                
                confirmationButton(title: isFavorite ? "Remove from favorites" : "Add to favorites", type: .favorite)
                
                ShareLink(
                    "Share",
                    item: pokemon.name
                )
            }
            
        }
        .padding(12)
        .background(Color.Library.white)
    }
}

private extension PokemonCardView {
    
    @ViewBuilder
    func confirmationButton(title: String, type: OptionType) -> some View {
        Button {
            onOptionSelected(type)
        } label: {
            Text(title)
        }
    }
}
