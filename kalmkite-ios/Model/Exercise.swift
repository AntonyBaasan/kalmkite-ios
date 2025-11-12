//
//  Activity.swift
//  kalmkite-ios
//
//  Created by antair on 10/4/25.
//
import Foundation
import SwiftData

class Exercise: Identifiable {
    var id: UUID
    var questionId: QuestionId
    var name: String
    var details: String
    var status: ExerciseStatus
    var exerciseType: ExerciseType
    var metadata: [String: String] = [:]

    init(
        id: UUID,
        questionId: QuestionId,
        name: String,
        details: String,
        status: ExerciseStatus,
        exerciseType: ExerciseType,
        metadata: [String: String] = [:]
    ) {
        self.id = id
        self.questionId = questionId
        self.name = name
        self.details = details
        self.status = status
        self.exerciseType = exerciseType
        self.metadata = metadata
    }
}
