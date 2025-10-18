//
//  ActivityStore.swift
//  kalmkite-ios
//
//  Created by antair on 10/6/25.
//

import Foundation
import SwiftUI

class WalkItemStore {
    static let shared = WalkItemStore()
    private(set) var walkItems: [WalkItem] = []

    private init() {
        loadSampleItems()
    }

    func loadSampleItems() {
        // Things to find/notice while walking
        walkItems = [
            WalkItem(id: 0, name: "Something green", icon: "leaf.fill", color: .green),
            WalkItem(id: 1, name: "A sound from far away", icon: "ear.fill", color: .purple),
            WalkItem(id: 2, name: "Something moving", icon: "wind", color: .blue),
            WalkItem(id: 3, name: "A pleasant scent", icon: "nose.fill", color: .pink),
            WalkItem(id: 4, name: "Something soft", icon: "hand.raised.fill", color: .orange),
            WalkItem(id: 5, name: "A pattern or texture", icon: "square.grid.2x2", color: .indigo),
            WalkItem(id: 6, name: "Your breath", icon: "lungs.fill", color: .cyan),
            WalkItem(id: 7, name: "Natural light", icon: "sun.max.fill", color: .yellow),
            WalkItem(id: 8, name: "Something unexpected", icon: "sparkles", color: .red),
            WalkItem(id: 9, name: "A shadow", icon: "moon.fill", color: .gray)
        ]
    }
    
    

}
