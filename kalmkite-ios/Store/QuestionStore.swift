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
        questions = loadSampleQuestions()
    }

    func loadSampleQuestions() -> [Question] {
        return [
            Question(
                id: QuestionId.workload,
                text: "Too much on your plate?",
                detail:
                    "Feeling overwhelmed by tasks, deadlines, or expectations?",
                icon: "tray.full"
            ),
            Question(
                id: QuestionId.workLifeBalance,
                text: "Struggling with work-life balance?",
                detail:
                    "Finding it hard to disconnect or make time for yourself?",
                icon: "clock.arrow.2.circlepath"
            ),
            Question(
                id: QuestionId.autonomy,
                text: "Wishing for more control?",
                detail: "Feeling like decisions are made without your input?",
                icon: "slider.horizontal.3"
            ),
            Question(
                id: QuestionId.micromanagement,
                text: "Feeling micromanaged at work?",
                detail: "Not trusted to work independently or make choices?",
                icon: "eye"
            ),
            Question(
                id: QuestionId.workspace,
                text: "Workspace not helping you focus?",
                detail:
                    "Physical environment making it hard to concentrate or feel comfortable?",
                icon: "deskclock"
            ),
            Question(
                id: QuestionId.recognition,
                text: "Feeling stuck or unrecognized?",
                detail: "Not seeing growth or appreciation for your efforts?",
                icon: "star.slash"
            ),
            Question(
                id: QuestionId.conflict,
                text: "Tension with someone at work?",
                detail:
                    "Experiencing conflict or discomfort in workplace relationships?",
                icon: "person.2.badge.gearshape"
            ),
        ]
    }
}
