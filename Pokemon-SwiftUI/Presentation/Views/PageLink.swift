//
//  PageLink.swift
//  Pokemon-SwiftUI
//
//  Created by Jamal Aartsen on 02/08/2024.
//

import Foundation
import SwiftUI

struct PageLink<Content: View>: View {
    
    let page: Page
    let content: () -> Content
    
    init(_ page: Page, @ViewBuilder content: @escaping () -> Content) {
        self.page = page
        self.content = content
    }
    
    var body: some View {
        NavigationLink(
            value: page,
            label: { content() }
        )
    }
}
