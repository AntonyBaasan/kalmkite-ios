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
                icon: "calendar",
                connectedExercises: [1, 2]
            ),
            Question(
                id: 2,
                text: "Pre-presentation anxiety",
                icon: "chart.bar.fill",
                connectedExercises: [1, 3, 6]
            ),
            Question(
                id: 3,
                text: "Can’t focus",
                icon: "brain.head.profile",
                connectedExercises: [5, 4]
            ),
            Question(
                id: 4,
                text: "Feeling behind",
                icon: "clock.fill",
                connectedExercises: [3, 2]
            ),
            Question(
                id: 5,
                text: "Hard conversation coming up",
                icon: "person.2.fill",
                connectedExercises: [1, 3]
            )
        ]
    }
    
    

}
