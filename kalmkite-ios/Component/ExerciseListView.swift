//
//  ExerciseListView.swift
//  kalmkite-ios
//
//  Created by antair on 10/7/25.
//

import Foundation
import SwiftUI

struct ExerciseListView: View {
    let exerciseIDs: [Int]

    // Fetch exercises matching the IDs
    @State private var exercises: [Exercise] = []

    var body: some View {
        VStack {
            VStack {
                ForEach(exercises) { exercise in
                    NavigationLink(
                        destination: ExerciseDetailView(exerciseId: exercise.id)
                    ) {
                        VStack(alignment: .leading) {
                            Text(exercise.name)
                                .font(.headline)
                            Text(String(exercise.details))
                                .font(.subheadline)
                        }.padding(10)
                    }
                }
            }
            .navigationTitle("Exercises")
        }
        .onAppear {
            exercises =
                ExerciseStore.shared.exercises.filter {
                    exerciseIDs.contains($0.id)
                }
        }
    }
}
#Preview {
    ExerciseListView(exerciseIDs: [1, 2, 3, 4])
}
