//
//  QuestionListView.swift
//  kalmkite-ios
//
//  Created by antair on 10/6/25.
//

import SwiftUI

struct QuestionListView: View {
    @State var questions: [Question] = QuestionStore.shared.questions

    var body: some View {
        NavigationStack {
            
            ZStack {
                // Background gradient
                LinearGradient(
                    colors: [.green.opacity(0.8), .green.opacity(0.6)],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 0) {
                        // Header section
                        VStack(spacing: 12) {
                            Text("How are you feeling?")
                                .font(.system(size: 32, weight: .bold))
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                            
                            Text("Select what's on your mind")
                                .font(.subheadline)
                                .foregroundColor(.white.opacity(0.9))
                        }
                        .padding(.top, 20)
                        .padding(.bottom, 30)
                        .padding(.horizontal)
                        
                        // Question cards
                        VStack(spacing: 16) {
                            ForEach(questions) { question in
                                NavigationLink(
                                    destination: ExerciseListView(
                                        exerciseIDs: question.connectedExercises
                                    )
                                ) {
                                    QuestionCard(question: question)
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                        .padding(.horizontal, 20)
                        .padding(.bottom, 20)
                        
                        // Test view link (for development)
//                        NavigationLink(destination: TestView()) {
//                            Text("Developer: Test View")
//                                .font(.caption)
//                                .foregroundColor(.secondary)
//                                .padding(.vertical, 20)
//                        }
                    }
                }
            }
            .navigationTitle("Home")
            .foregroundStyle(.white)
            .navigationBarTitleDisplayMode(.inline)
        }
        .tint(.white)
    }
}

#Preview {
    QuestionListView()
}
