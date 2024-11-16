//
//  TypeColors.swift
//  Pokemon-SwiftUI
//
//  Created by Jamal Aartsen on 07/08/2024.
//

import SwiftUI

enum TypeColors {
    static let colors: [String: Color] = [
        "normal": Color(hex: "#A8A77A"),
        "fire": Color(hex: "#EE8130"),
        "water": Color(hex: "#6390F0"),
        "electric": Color(hex: "#F7D02C"),
        "grass": Color(hex: "#7AC74C"),
        "ice": Color(hex: "#96D9D6"),
        "fighting": Color(hex: "#C22E28"),
        "poison": Color(hex: "#A33EA1"),
        "ground": Color(hex: "#E2BF65"),
        "flying": Color(hex: "#A98FF3"),
        "psychic": Color(hex: "#F95587"),
        "bug": Color(hex: "#A6B91A"),
        "rock": Color(hex: "#B6A136"),
        "ghost": Color(hex: "#735797"),
        "dragon": Color(hex: "#6F35FC"),
        "dark": Color(hex: "#705746"),
        "steel": Color(hex: "#B7B7CE"),
        "fairy": Color(hex: "#D685AD")
    ]
    
    static func color(forType type: String) -> Color? {
        return colors[type]
    }
}
