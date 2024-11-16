//
//  UserDefaults+Extension.swift
//  Pokemon-SwiftUI
//
//  Created by Jamal Aartsen on 09/08/2024.
//

import Foundation

enum UserDefaultsKeys: String {
    case favoritePokemons
}

extension UserDefaults {
    
    func setValue(_ value: Any?, forKey key: UserDefaultsKeys) {
        setValue(value, forKey: key.rawValue)
    }
    
    func getData(forKey key: UserDefaultsKeys) -> Data? {
        data(forKey: key.rawValue)
    }
}
