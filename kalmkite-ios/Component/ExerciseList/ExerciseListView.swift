//
//  ExerciseListView.swift
//  kalmkite-ios
//
//  Created by antair on 10/7/25.
//

import Foundation
import SwiftUI

struct ExerciseListView: View {
    let questionId: QuestionId

    @State private var exercises: [Exercise] = []

    var body: some View {
        ZStack {
            // Background gradient
            LinearGradient(
                colors: [.darkGreen.opacity(0.8), .darkGreen.opacity(0.6)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            ScrollView {
                VStack(spacing: 0) {
                    // Header section
                    VStack(spacing: 12) {
                        Text("Choose an exercise")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)

                        Text("Pick what feels right for you now")
                            .font(.subheadline)
                            .foregroundColor(.white.opacity(0.8))
                    }
                    .padding(.top, 20)
                    .padding(.bottom, 30)
                    .padding(.horizontal)

                    // Exercise cards - larger since only 2-3 items
                    VStack(spacing: 20) {
                        ForEach(exercises) { exercise in
                            NavigationLink(
                                destination: ExerciseDetailView(
                                    exerciseId: exercise.id
                                )
                            ) {
                                ExerciseLargeCard(exercise: exercise)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 40)
                }
            }
        }
        .navigationTitle("Exercises")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            exercises = ExerciseStore.shared.getExerciseByQuestionId(by: questionId)
        }
    }
}

#Preview {
    ExerciseListView(questionId: QuestionId.workload)
}
