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
//        List(exercises) { exercise in
//            VStack(alignment: .leading) {
//                Text(exercise.name)
//                    .font(.headline)
//                Text(exercise.description)
//                    .font(.subheadline)
//            }
//        }
        List(exerciseIDs, id: \.self) { id in
            VStack(alignment: .leading) {
                Text("Exercise ID: \(id)")
                    .font(.headline)
                Text(String(id))
                    .font(.subheadline)
            }
        }
        .navigationTitle("Exercises")
        .onAppear{
            exercises =
                ExerciseStore.shared.exercises.filter { exerciseIDs.contains($0.id) }
        }
    }
}
#Preview {
    ExerciseListView(exerciseIDs: [1,2,3,4])
}
