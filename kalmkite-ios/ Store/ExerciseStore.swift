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

    private func loadSampleExercises() {
        exercises = [
            Exercise(
                id: 1,
                name: "Guided Breathing",
                details: "A 2-minute breathing exercise to help you reset.",
                duration: 60,
                status: ExerciseStatus.Active,
                exerciseType: ExerciseType.Breathing
            ),
            Exercise(
                id: 2,
                name: "Quick Journal",
                details: "Write down what’s bothering you in a safe space.",
                duration: 180,
                status: ExerciseStatus.Active,
                exerciseType: ExerciseType.Journaling
            ),
            Exercise(
                id: 3,
                name: "Affirmation Boost",
                details: "Positive statements to counter negative thoughts.",
                duration: 90,
                status: ExerciseStatus.Active,
                exerciseType: ExerciseType.Affirmation
            ),
            Exercise(
                id: 4,
                name: "Focus Timer",
                details: "A Pomodoro-style timer to help you regain focus.",
                duration: 480,
//                duration: 60,
                status: ExerciseStatus.Active,
                exerciseType: ExerciseType.FocusTime
            ),
            Exercise(
                id: 5,
                name: "Decompression Walk",
                details:
                    "A short guided walk to help you unwind after meetings.",
                duration: 480,
                status: ExerciseStatus.Active,
                exerciseType: ExerciseType.Walking
            ),
            Exercise(
                id: 6,
                name: "Power Pose",
                details:
                    "Strike a confident pose for 2 minutes to boost your mood and presence.",
                duration: 120,
                status: ExerciseStatus.Active,
                exerciseType: ExerciseType.PowerPose
            ),
        ]
    }

    func getExercise(by id: Int) -> Exercise? {
        return exercises.first(where: { $0.id == id })
    }
}
