//
//  NavigationStore.swift
//  Pokemon-SwiftUI
//
//  Created by Jamal Aartsen on 02/08/2024.
//

import Foundation

enum Page: Hashable {
    case pokemonDetail(Pokemon)
}

@MainActor
final class NavigationStore: ObservableObject {
    
    @Published var path: [Page] = []
}

// MARK: Actions
extension NavigationStore {
    
    func push(_ path: Page) {
        self.path.append(path)
    }
    
    @discardableResult
    func pop() -> Page? {
        path.popLast()
    }
}
