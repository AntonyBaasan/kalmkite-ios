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
    var id: Int
    var name: String
    var details: String
    var duration: TimeInterval
    
    init(id: Int, name: String, details: String, duration: TimeInterval) {
        self.id = id
        self.name = name
        self.details = details
        self.duration = duration
    }
}
