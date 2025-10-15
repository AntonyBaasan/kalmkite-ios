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
                GuidedBreathingView(exerciseId: self.exerciseId)
            } else if exercise?.exerciseType == ExerciseType.Affirmation {
                AffirmationView(exerciseId: self.exerciseId)
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
