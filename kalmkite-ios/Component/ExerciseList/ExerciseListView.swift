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
    
    @State private var exercises: [Exercise] = []
    
    var body: some View {
        ZStack {
            // Background gradient
            LinearGradient(
                colors: [
                    Color.green.opacity(0.2),
                    Color.green.opacity(0.1),
                    Color.white
                ],
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
                            .foregroundColor(.primary)
                        
                        Text("Pick what feels right for you now")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    .padding(.top, 20)
                    .padding(.bottom, 30)
                    .padding(.horizontal)
                    
                    // Exercise cards - larger since only 2-3 items
                    VStack(spacing: 20) {
                        ForEach(exercises) { exercise in
                            NavigationLink(
                                destination: ExerciseDetailView(exerciseId: exercise.id)
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
            exercises = ExerciseStore.shared.exercises.filter {
                exerciseIDs.contains($0.id)
            }
        }
    }
}



#Preview {
    ExerciseListView(exerciseIDs: [1, 2, 3, 4])
}
