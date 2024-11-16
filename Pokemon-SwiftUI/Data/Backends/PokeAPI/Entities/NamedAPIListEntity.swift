//
//  NamedAPIListEntity.swift
//  Pokemon-SwiftUI
//
//  Created by Jamal Aartsen on 02/08/2024.
//

import Foundation

struct NamedAPIListEntity: Codable {
    let count: Int?
    let next: URL?
    let previous: URL?
    let results: [NamedAPIEntity]
}
