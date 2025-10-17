//
//  ExerciseDetailView.swift
//  kalmkite-ios
//
//  Created by antair on 10/14/25.
//

import SwiftUI

struct ExerciseDetailView: View {
    let exerciseId: Int
    @State private var exercise: Exercise?

    var body: some View {
        VStack {
            if exercise?.exerciseType == ExerciseType.Breathing {
                // Breathing Exercise View
                GuidedBreathingView(exerciseId: self.exerciseId)
            } else if exercise?.exerciseType == ExerciseType.Affirmation {
                // Affirmation Exercise View
                AffirmationView(exerciseId: self.exerciseId)
            } else if exercise?.exerciseType == ExerciseType.Walking {
                WalkView(exerciseId: self.exerciseId)
            } else if exercise?.exerciseType == ExerciseType.PowerPose {
                // Power Pose Exercise View
                PowerPoseView(exerciseId: self.exerciseId)
            } else if exercise?.exerciseType == ExerciseType.FocusTime {
                // Focus Time Exercise View
//                FocusView(exerciseId: self.exerciseId)
//                FocusBubbleView(exerciseId: self.exerciseId)
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
    ExerciseDetailView(exerciseId: 1)
}
