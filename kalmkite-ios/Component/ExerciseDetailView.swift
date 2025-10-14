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
            GuidedBreathing(exerciseId: self.exerciseId)
        }
    }
}


#Preview {
    ExerciseDetailView(exerciseId: 1)
}
