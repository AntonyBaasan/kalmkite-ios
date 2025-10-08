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
    var connectedExercises: [Int] = []
    
    init(id: Int, text: String, connectedExercises: [Int] = []) {
        self.id = id
        self.text = text
        self.connectedExercises = connectedExercises
    }
}
    
