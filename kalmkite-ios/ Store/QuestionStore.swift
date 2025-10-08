//
//  ActivityStore.swift
//  kalmkite-ios
//
//  Created by antair on 10/6/25.
//

import Foundation

class QuestionStore {
    static let shared = QuestionStore()
    private(set) var questions: [Question] = []

    private init() {
        loadSampleQuestions()
    }

    func loadSampleQuestions() {
        questions = [
            Question(
                id: 1,
                text: "Too many meetings",
                connectedExercises: [1, 2]
            ),
            Question(
                id: 2,
                text: "Pre-presentation anxiety",
                connectedExercises: [1, 3, 6]
            ),
            Question(
                id: 3,
                text: "Can’t focus",
                connectedExercises: [5, 4]
            ),
            Question(
                id: 4,
                text: "Feeling behind",
                connectedExercises: [3, 2]
            ),
            Question(
                id: 5,
                text: "Hard conversation coming up",
                connectedExercises: [1, 3]
            )
        ]
    }
    
    

}
