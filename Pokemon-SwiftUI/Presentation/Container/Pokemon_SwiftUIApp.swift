//
//  Pokemon_SwiftUIApp.swift
//  Pokemon-SwiftUI
//
//  Created by Jamal Aartsen on 26/07/2024.
//

import SwiftUI

@main
struct Pokemon_SwiftUIApp: App {
    
    init() {
        Dependencies.register()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
