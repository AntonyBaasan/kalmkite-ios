//
//  Questions.swift
//  kalmkite-ios
//
//  Created by antair on 10/6/25.
//
import Foundation
import SwiftData

@Model
class Question: Identifiable {
    var id: Int
    var text: String
    var icon: String
    var connectedExercises: [Int] = []
    
    init(id: Int, text: String, icon: String, connectedExercises: [Int] = []) {
        self.id = id
        self.text = text
        self.icon = icon
        self.connectedExercises = connectedExercises
    }
}
    
