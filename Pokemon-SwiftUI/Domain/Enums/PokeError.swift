//
//  PokeError.swift
//  Pokemon-SwiftUI
//
//  Created by Jamal Aartsen on 02/08/2024.
//

import Foundation

enum PokeError: LocalizedError {
    
    case general
    case noInternet
    case mapping
    
    var errorDescription: String? {
        switch self {
        case .general, .mapping:
            return "something went wrong"
        case .noInternet:
            return "you appear to be offline"
        }
    }
}
