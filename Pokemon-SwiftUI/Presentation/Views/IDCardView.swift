//
//  IDCardView.swift
//  Pokemon-SwiftUI
//
//  Created by Jamal Aartsen on 06/08/2024.
//

import SwiftUI

struct IDCardView: View {
    
    let id: Int
    
    var body: some View {
        Text(String(format: "%03d", id))
            .font(.system(size: 10))
            .foregroundStyle(Color.Library.white)
            .padding(EdgeInsets(top: 4, leading: 6, bottom: 4, trailing: 6))
            .background(Color.Library.primaryPurple)
            .clipShape(RoundedRectangle(cornerRadius: 4))
    }
}
