//
//  TagsView.swift
//  Pokemon-SwiftUI
//
//  Created by Jamal Aartsen on 05/08/2024.
//

import SwiftUI

struct TagsView: View {
    
    let tags: [Types]
    
    var body: some View {
        HStack(spacing: 8) {
            ForEach(tags, id: \.id) { tag in
                Text("\(tag.name)")
                    .foregroundStyle(Color.Library.white)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 5)
                    .background(TypeColors.colors[tag.name.lowercased()] ?? Color.Library.black)
                    .clipShape(RoundedRectangle(cornerRadius: 100))
            }
        }
        .padding(.horizontal, 24)
        .padding(.top, 12)
    }
}
