//
//  QuestionListView.swift
//  kalmkite-ios
//
//  Created by antair on 10/6/25.
//

import SwiftUI

struct QuestionListView: View {
    @State var title: String = ""
    @State var titleOptions: [String] = [
        "How’s Your Mind Today?",
        "What’s On Your Heart?",
        "Where’s Your Head At?",
        "How’s Your Inner Weather?",
        "What’s Moving Inside?",
        "How Are You Showing Up?",
        "What's Rising for You?",
    ]
    @State var questions: [Question] = QuestionStore.shared.questions

    var body: some View {
        NavigationStack {

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
                            Text(title)
                                .font(.system(size: 48, weight: .bold))
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
                        VStack(spacing: 8) {
                            ForEach(questions) { question in
                                NavigationLink(
                                    destination: ExerciseListView(
                                        questionId: question.id
                                    )
                                ) {
                                    QuestionCard(question: question)
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                        .padding(.horizontal, 20)
                        .padding(.bottom, 5)
                        .onAppear {
                            titleOptions.shuffle()
                        }

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
        .onAppear {
            title = titleOptions.shuffled().first ?? titleOptions[0]
        }

    }
}

#Preview {
    QuestionListView()
}
