//
//  ExerciseDetailView.swift
//  kalmkite-ios
//
//  Created by antair on 10/14/25.
//

import Foundation
import SwiftUI

struct ExerciseDetailView: View {
    let exerciseId: UUID
    @State private var exercise: Exercise?

    var body: some View {
        VStack {
            if exercise?.exerciseType == ExerciseType.Breathing {
                // Breathing Exercise View
                GuidedBreathingView(exerciseId: self.exerciseId)
            } else if exercise?.exerciseType == ExerciseType.Affirmation {
                let affirmationType =
                    exercise?.metadata["affirmationType"]
                    ?? AffirmationType.iam.rawValue
                if affirmationType == AffirmationType.powerpose.rawValue {
                    PowerPoseView(exerciseId: self.exerciseId)
                } else {
                    // Affirmation Exercise View
                    AffirmationView(exerciseId: self.exerciseId)
                }
            } else if exercise?.exerciseType == ExerciseType.Walking {
                WalkView(exerciseId: self.exerciseId)
            } else if exercise?.exerciseType == ExerciseType.FocusTime {
                FocusCircularView(exerciseId: self.exerciseId)
            } else {
                Text("Exercise type not supported yet.")
            }
        }.onAppear {
            self.exercise = ExerciseStore.shared.exercises.first {
                $0.id == self.exerciseId
            }
        }
    }
}

#Preview {
    ExerciseDetailView(exerciseId: UUID(uuidString: "A1B2C3D4-E5F6-7890-1234-56789ABCDEF0")!)
}
