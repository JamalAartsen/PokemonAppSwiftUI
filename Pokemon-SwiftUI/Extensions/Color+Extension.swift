//
//  Color+Extension.swift
//  Pokemon-SwiftUI
//
//  Created by Jamal Aartsen on 26/07/2024.
//

import SwiftUI

extension Color {
    
    enum Library {
        static var primaryDaylight: Color { Color("daylight") }
        static var primaryPurple: Color { Color("primaryPurple") }
        static var primaryMidnight: Color { Color("midnight") }
        static var pokecardBackground: Color { Color("pokecardBackground") }
        static var white: Color = .white
        static var black: Color = .black
    }
    
    init(hex: String) {
        var cleanedHex = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if cleanedHex.hasPrefix("#") {
            cleanedHex.remove(at: cleanedHex.startIndex)
        }
        
        guard cleanedHex.count == 6 || cleanedHex.count == 8 else {
            self.init(.clear)
            return
        }
        
        var rgb: UInt64 = 0
        Scanner(string: cleanedHex).scanHexInt64(&rgb)
        
        let r, g, b, a: Double
        if cleanedHex.count == 8 {
            r = Double((rgb >> 24) & 0xFF) / 255.0
            g = Double((rgb >> 16) & 0xFF) / 255.0
            b = Double((rgb >> 8) & 0xFF) / 255.0
            a = Double(rgb & 0xFF) / 255.0
        } else {
            r = Double((rgb >> 16) & 0xFF) / 255.0
            g = Double((rgb >> 8) & 0xFF) / 255.0
            b = Double(rgb & 0xFF) / 255.0
            a = 1.0
        }
        
        self.init(red: r, green: g, blue: b, opacity: a)
        
    }
}
