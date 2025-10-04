//
//  Activity.swift
//  kalmkite-ios
//
//  Created by antair on 10/4/25.
//
import Foundation
import SwiftData

@Model
class ExerciseGroup: Identifiable {
    var id: UUID = UUID()
    var name: String
    
    init(id: UUID, name: String) {
        self.id = id
        self.name = name
    }
}
