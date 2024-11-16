//
//  Species+Mapper.swift
//  Pokemon-SwiftUI
//
//  Created by Jamal Aartsen on 15/08/2024.
//

import Foundation

extension Species {
    
    static func map(id: Int, name: String) throws -> Species {
        return Species(id: id, name: name)
    }
}
