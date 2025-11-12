//
//  ActivityStore.swift
//  kalmkite-ios
//
//  Created by antair on 10/6/25.
//

import Foundation

final class ExerciseStore {
    static let shared = ExerciseStore()

    private(set) var exercises: [Exercise] = []

    private init() {
        loadSampleExercises()
    }

    private func loadWorkloadExercises() -> [Exercise] {
        return [
            Exercise(
                id: UUID(uuidString: "A1B2C3D4-E5F6-7890-1234-56789ABCDEF0")!,
                questionId: .workload,
                name: "Guided Breathing",
                details: "A 2-minute breathing exercise to help you reset.",
                status: ExerciseStatus.Active,
                exerciseType: ExerciseType.Breathing,
                metadata: [
                    "duration": "120",
                    "breathingPattern": "4-7-8",
                ]
            ),
            Exercise(
                id: UUID(),
                questionId: .workload,
                name: "Quick Journal",
                details: "Write down what’s bothering you in a safe space.",
                status: ExerciseStatus.Disabled,
                exerciseType: ExerciseType.Journaling
            ),
            Exercise(
                id: UUID(),
                questionId: .workload,
                name: "Guided Breathing",
                details: "A 5-minute breathing exercise to help you reset.",
                status: ExerciseStatus.Active,
                exerciseType: ExerciseType.Breathing,
                metadata: [
                    "duration": "300",
                    "breathingPattern": "4-7-8",
                ]
            ),
            Exercise(
                id: UUID(uuidString: "0FEDCBA9-8765-4321-0FED-CBA987654321")!,
                questionId: .workload,
                name: "Focus Timer",
                details: "A Pomodoro-style timer to help you regain focus.",
                status: ExerciseStatus.Active,
                exerciseType: ExerciseType.FocusTime,
                metadata: [
                    "duration": "120"
                ]
            ),
        ]
    }

    private func loadWorkLifeBalanceExercises() -> [Exercise] {
        return [
            Exercise(
                id: UUID(),
                questionId: .workLifeBalance,
                name: "What is your long term goal?",
                details: "Reflect on your work-life balance goals.",
                status: ExerciseStatus.Active,
                exerciseType: ExerciseType.Journaling
            ),
            Exercise(
                id: UUID(uuidString: "FEDCBA98-7654-3210-FEDC-BA9876543210")!,
                questionId: .workLifeBalance,
                name: "Affirmation Boost",
                details: "Positive statements to counter negative thoughts.",
                status: ExerciseStatus.Active,
                exerciseType: ExerciseType.Affirmation,
                metadata: [
                    "affirmationType": AffirmationType.worklifebalance.rawValue
                ]
            ),
        ]
    }

    private func loadAutonomyExercises() -> [Exercise] {
        return [
            Exercise(
                id: UUID(),
                questionId: .autonomy,
                name: "Control Reframe",
                details: "Reflect on what you can influence today.",
                status: ExerciseStatus.Active,
                exerciseType: ExerciseType.Journaling
            ),
            Exercise(
                id: UUID(),
                questionId: .autonomy,
                name: "Empowerment Affirmations",
                details:
                    "Boost your sense of agency with positive affirmations.",
                status: ExerciseStatus.Active,
                exerciseType: ExerciseType.Affirmation,
                metadata: [
                    "affirmationType": AffirmationType.iam.rawValue
                ]
            ),
            Exercise(
                id: UUID(uuidString: "12345678-90AB-CDEF-1234-567890ABCDEF")!,
                questionId: .conflict,
                name: "Decompression Walk",
                details:
                    "A short guided walk to help you unwind and clear your mind.",
                status: ExerciseStatus.Active,
                exerciseType: ExerciseType.Walking
            ),
        ]
    }

    private func loadMicromanagementExercises() -> [Exercise] {
        return [
            Exercise(
                id: UUID(),
                questionId: .micromanagement,
                name: "Boundary Builder",
                details:
                    "Practice setting gentle boundaries and asserting your space.",
                status: ExerciseStatus.Disabled,
                exerciseType: ExerciseType.Journaling
            ),
            Exercise(
                id: UUID(),
                questionId: .micromanagement,
                name: "Confidence Boost",
                details: "Affirm your skills and independence.",
                status: ExerciseStatus.Active,
                exerciseType: ExerciseType.Affirmation,
                metadata: [
                    "affirmationType": AffirmationType.iam.rawValue
                ]
            ),
        ]
    }

    private func loadWorkspaceExercises() -> [Exercise] {
        return [
            Exercise(
                id: UUID(),
                questionId: .workspace,
                name: "Desk Reset",
                details: "Take 2 minutes to tidy and refresh your space.",
                status: ExerciseStatus.Active,
                exerciseType: ExerciseType.FocusTime,
                metadata: [
                    "duration": "120"
                ]
            ),
            Exercise(
                id: UUID(),
                questionId: .workspace,
                name: "Focus Breathing",
                details: "A short breathing exercise to regain clarity.",
                status: ExerciseStatus.Active,
                exerciseType: ExerciseType.Breathing,
                metadata: [
                    "duration": "180",
                    "breathingPattern": "box",
                ]
            ),
        ]
    }

    private func loadRecognitionExercises() -> [Exercise] {
        return [
            Exercise(
                id: UUID(),
                questionId: .recognition,
                name: "Self-Acknowledgment",
                details: "Write down three things you did well today.",
                status: ExerciseStatus.Active,
                exerciseType: ExerciseType.Journaling
            ),
            Exercise(
                id: UUID(),
                questionId: .recognition,
                name: "Gratitude Boost",
                details: "Reflect on moments of appreciation or kindness.",
                status: ExerciseStatus.Active,
                exerciseType: ExerciseType.Affirmation,
                metadata: [
                    "affirmationType": AffirmationType.gratitude.rawValue
                ]
            ),
        ]
    }

    private func loadConflictExercises() -> [Exercise] {
        return [
            Exercise(
                id: UUID(),
                questionId: .conflict,
                name: "Tension Release",
                details:
                    "A calming breathing exercise to ease emotional tension.",
                status: ExerciseStatus.Active,
                exerciseType: ExerciseType.Breathing,
                metadata: [
                    "duration": "150",
                    "breathingPattern": "4-4-4-4",
                ]
            ),
            Exercise(
                id: UUID(),
                questionId: .conflict,
                name: "Perspective Shift",
                details: "Explore the other person’s viewpoint with curiosity.",
                status: ExerciseStatus.Active,
                exerciseType: ExerciseType.Journaling
            ),
            Exercise(
                id: UUID(),
                questionId: .conflict,
                name: "Power Pose",
                details:
                    "Strike a confident pose for 2 minutes to boost your mood and presence.",
                status: ExerciseStatus.Active,
                exerciseType: ExerciseType.Affirmation,
                metadata: [
                    "affirmationType": AffirmationType.powerpose.rawValue
                ]
            ),
        ]
    }

    private func loadSampleExercises() {
        exercises =
            loadWorkloadExercises()
            + loadWorkLifeBalanceExercises()
            + loadAutonomyExercises()
            + loadMicromanagementExercises()
            + loadWorkspaceExercises()
            + loadRecognitionExercises()
            + loadConflictExercises()
    }

    func getExerciseByQuestionId(by questionId: QuestionId) -> [Exercise] {
        return exercises.filter { $0.questionId == questionId && $0.status == .Active }
    }

    func getExercise(by id: UUID) -> Exercise? {
        return exercises.first(where: { $0.id == id && $0.status == .Active })
    }
}
