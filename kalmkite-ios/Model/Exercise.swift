//
//  Activity.swift
//  kalmkite-ios
//
//  Created by antair on 10/4/25.
//
import Foundation
import SwiftData

@Model
class Exercise: Identifiable {
    var id: UUID = UUID()
    var name: String
    var duration: TimeInterval
    
    init(id: UUID, name: String, duration: TimeInterval) {
        self.id = id
        self.name = name
        self.duration = duration
    }
}
