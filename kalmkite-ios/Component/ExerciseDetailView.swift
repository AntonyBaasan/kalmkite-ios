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
            Text("\(exercise?.name ?? "Loading...")!")
                        .onAppear {
                            exercise = ExerciseStore.shared.getExercise(by: self.exerciseId)
                        }
        }
    }
}

#Preview {
    ExerciseDetailView(exerciseId: 1)
}
