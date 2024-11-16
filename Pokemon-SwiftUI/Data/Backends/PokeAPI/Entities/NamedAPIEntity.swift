//
//  NamedAPIEntity.swift
//  Pokemon-SwiftUI
//
//  Created by Jamal Aartsen on 02/08/2024.
//

import Foundation

struct NamedAPIEntity: Codable, Equatable {
    let name: String
    let url: URL
}

extension NamedAPIEntity {
    
    /// Most named api entities simply end in the id being the last path element, so this will generally allow you to access the id
    func getId() -> Int? {
        guard let idString = url.pathComponents.last,
              let id = Int(idString) else {
            return nil
        }
        return id
    }
}
