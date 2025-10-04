//
//  Activity.swift
//  kalmkite-ios
//
//  Created by antair on 10/4/25.
//
import Foundation
import SwiftData

@Model
class Activity : Identifiable {
    var id: UUID = UUID()
    var exercise: Exercise
    var createdAt: Date = Date()
    
    init(id: UUID, exercise: Exercise, createdAt: Date) {
        self.id = id
        self.exercise = exercise
        self.createdAt = createdAt
    }
}
