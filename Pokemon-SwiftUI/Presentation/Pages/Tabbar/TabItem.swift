//
//  TabItem.swift
//  Pokemon-SwiftUI
//
//  Created by Jamal Aartsen on 26/07/2024.
//

import SwiftUI

struct TabItem: View {
    
    var identifier: Tab
    var activeTab: Tab
    
    var body: some View {
        VStack {
            if activeTab == identifier {
                identifier.activeImage
            } else {
                identifier.image
            }
            
            Text(identifier.name)
        }
    }
}
