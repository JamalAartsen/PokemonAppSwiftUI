//
//  StatsView.swift
//  Pokemon-SwiftUI
//
//  Created by Jamal Aartsen on 05/08/2024.
//

import SwiftUI

struct StatsView: View {
    
    let stats: [Stats]
    
    var body: some View {
        VStack(spacing: 24) {
            ForEach(stats, id: \.id) { item in
                statsItem(name: item.name, base: item.base)
            }
        }
    }
}

extension StatsView {
    
    @ViewBuilder
    func statsItem(name: String, base: Int) -> some View {
        VStack {
            HStack {
                Text(name)
                    .font(.system(size: 14, weight: .bold))
                    .foregroundStyle(Color.Library.black)
                
                Spacer()
                
                Text("\(base)")
                    .font(.system(size: 14, weight: .regular))
                    .foregroundStyle(Color.Library.black.opacity(0.65))
            }
            progressBar(value: base)
        }
    }
    
    @ViewBuilder
    func progressBar(value: Int) -> some View {
        let progress = CGFloat(value) / 255.0
        ProgressView(value: progress)
            .tint(Color.Library.primaryPurple)
            .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}
