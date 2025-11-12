//
//  Questions.swift
//  kalmkite-ios
//
//  Created by antair on 10/6/25.
//
import Foundation
import SwiftData

class Question: Identifiable {
    var id: QuestionId
    var text: String
    var detail: String
    var icon: String
    
    init(id: QuestionId, text: String, detail: String, icon: String) {
        self.id = id
        self.text = text
        self.detail = detail
        self.icon = icon
    }
}
    
