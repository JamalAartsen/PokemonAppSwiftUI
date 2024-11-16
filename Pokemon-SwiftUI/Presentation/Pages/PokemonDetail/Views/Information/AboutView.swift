//
//  AboutView.swift
//  Pokemon-SwiftUI
//
//  Created by Jamal Aartsen on 05/08/2024.
//

import SwiftUI

struct AboutView: View {
    
    let about: [KeyValueItem]
    
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            LazyVGrid(columns: columns, alignment: .leading, spacing: 16) {
                ForEach(about, id: \.key) { item in
                    Text(item.key)
                        .font(.system(size: 14, weight: .bold))
                        .foregroundStyle(Color.black)
                    
                    Text(item.value)
                        .font(.system(size: 14, weight: .regular))
                        .foregroundStyle(Color.black.opacity(0.65))
                }
            }
        }
        .frame(maxWidth: .infinity)
    }
}
