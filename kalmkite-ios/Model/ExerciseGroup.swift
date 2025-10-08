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
    var id: Int
    var name: String
    
    init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
}
