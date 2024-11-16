//
//  CustomSegmentedControl.swift
//  Pokemon-SwiftUI
//
//  Created by Jamal Aartsen on 05/08/2024.
//

import SwiftUI

struct SegmentItem: Identifiable {
    let id: Int
    let name: String
    var content: any View
}

struct Jamal: View {
    var body: some View {
        VStack {
            Text("Jamal")
            Text("Jamal")
            Text("Jamal")
            Text("Jamal")
            Text("Jamal")
            Text("Jamal")
            Text("Jamal")
            Text("Jamal")
            Text("Jamal")
            Text("Jamal")
        }
    }
}

struct CustomSegmentedControl: View {
    
    let textPadding: CGFloat
    let horizontalPadding: CGFloat
    let verticalPadding: CGFloat
    let parentWidth: CGFloat
    
    let items: [SegmentItem]
    
    @State private var activeTab: Int = 0
    
    var body: some View {
        
        let numberOfTabs = CGFloat(items.count)
        let horizontalPaddingForTabs = (horizontalPadding * 2)
        let tabWidth = (parentWidth - horizontalPaddingForTabs) / numberOfTabs
        
            VStack {
                HStack(spacing: 0) {
                    ForEach(items, id: \.id) { item in
                        VStack(spacing: 0) {
                            
                            if tabWidth > 0 {
                                Text(item.name)
                                    .padding(textPadding)
                                    .font(.system(size: 14, weight: .bold))
                                    .foregroundStyle(activeTab == item.id ? Color.Library.black : Color.Library.black.opacity(0.3))
                                    .frame(width: tabWidth > 0 ? tabWidth : 0)
//                                    .background(.green)
                                    .lineLimit(1)
                                //                                .animation(.easeInOut, value: activeTab)
                                
                                Rectangle()
                                    .frame(width: tabWidth > 0 ? tabWidth : 0, height: 2)
                                    .foregroundStyle(activeTab == item.id ? Color.Library.primaryPurple : Color.Library.black.opacity(0.3))
                                //                                .animation(.easeInOut(duration: 0.1), value: activeTab)
                            }
                        }
                        .onTapGesture {
//                            withAnimation {
                                activeTab = item.id
//                            }
                        }
                    }
                }
                .padding(.horizontal, horizontalPadding)
//                .background(.red)
                
                if tabWidth > 0 {
                    if let activeItem = items.first(where: { $0.id == activeTab }) {
                        AnyView(activeItem.content)
                            .padding(.horizontal, horizontalPadding)
                            .padding(.vertical, verticalPadding)
                    }
                }
            }
//            .background(Color.orange)
    }
}
