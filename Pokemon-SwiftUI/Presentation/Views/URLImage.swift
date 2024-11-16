//
//  URLImage.swift
//  Pokemon-SwiftUI
//
//  Created by Jamal Aartsen on 02/08/2024.
//

import Foundation
import SwiftUI

struct URLImage: View {
    
    let url: URL?
    let contentMode: ContentMode
    
    @Environment(\.redactionReasons) private var redactionReasons
    
    init(_ url: URL?, contentMode: ContentMode = .fit) {
        self.url = url
        self.contentMode = contentMode
    }
    
    var body: some View {
        if redactionReasons.isEmpty {
            AsyncImage(
                url: url,
                content: { image in
                    image
                        .resizable()
                },
                placeholder: { placeholder() }
            )
            .aspectRatio(contentMode: contentMode)
        } else {
            AsyncImage(url: nil)
                .redacted(reason: redactionReasons)
                .aspectRatio(contentMode: contentMode)
        }
    }
}

private extension URLImage {
    
    @ViewBuilder
    func placeholder() -> some View {
        Color.clear.overlay(ProgressView())
    }
}
