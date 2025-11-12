//
//  AffirmationView.swift
//  kalmkite-ios
//
//  Created by antair on 10/15/25.
//

import SwiftUI

struct AffirmationView: View {
    @Environment(\.dismiss) private var dismiss

    let exerciseId: UUID
    @State private var exercise: Exercise?
    @State private var affirmations: [Affirmation] = []
    @State private var currentIndex = 0
    @State private var isComplete = false

    private let count = 10

    var body: some View {
        ZStack {
            // Background gradient - same as PowerPoseView
            LinearGradient(
                colors: [
                    Color.darkGreen.opacity(0.8), Color.darkGreen.opacity(0.6),
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            VStack(spacing: 0) {
                // Header
                HStack {
                    //                    Button {
                    //                        dismiss()
                    //                    } label: {
                    //                        Image(systemName: "xmark")
                    //                            .font(.title3)
                    //                            .foregroundColor(.white)
                    //                    }

                    Spacer()

                    Text(exercise?.name ?? "Affirmations")
                        .font(.headline)
                        .foregroundColor(.white)

                    Spacer()

                    // Invisible button for balance
                    //                    Image(systemName: "xmark")
                    //                        .font(.title3)
                    //                        .foregroundColor(.clear)
                }
                .padding()

                // Progress indicator
                HStack(spacing: 8) {
                    ForEach(0..<count, id: \.self) { index in
                        Capsule()
                            .fill(
                                index <= currentIndex
                                    ? .white : .white.opacity(0.3)
                            )
                            .frame(height: 4)
                    }
                }
                .padding(.horizontal)
                .padding(.bottom, 20)

                Spacer()

                // Main content area
                TabView(selection: $currentIndex) {
                    ForEach(Array(affirmations.enumerated()), id: \.offset) {
                        index,
                        affirmation in
                        VStack(spacing: 30) {
                            // Affirmation number
                            Text("\(index + 1) of \(count)")
                                .font(.subheadline)
                                .foregroundColor(.white.opacity(0.8))

                            // Affirmation text
                            Text(affirmation.text)
                                .font(.title2)
                                .fontWeight(.medium)
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 40)
                                .minimumScaleFactor(0.8)

                            Spacer()
                                .frame(height: 60)
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .tag(index)
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .never))

                Spacer()

                // Bottom button area
                if currentIndex == count - 1 {
                    Button {
                        self.isComplete = true
                    } label: {
                        Text("Done")
                            .font(.headline)
                            .foregroundColor(.darkGreen)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(12)
                    }
                    .padding(.horizontal, 40)
                    .padding(.bottom, 40)
                    .transition(.move(edge: .bottom).combined(with: .opacity))
                } else {
                    // Instruction text
                    HStack(spacing: 12) {
                        Image(systemName: "hand.draw")
                            .font(.title3)
                        Text("Swipe to continue")
                            .font(.subheadline)
                    }
                    .foregroundColor(.white.opacity(0.7))
                    .padding(.bottom, 40)
                }
            }
        }
        .onAppear {
            self.exercise = ExerciseStore.shared.getExercise(
                by: self.exerciseId
            )
            guard
                let affirmationTypeStr: String = exercise?.metadata[
                    "affirmationType"
                ]!,
                let affirmationType = AffirmationType(
                    rawValue: affirmationTypeStr
                )
            else {
                print(
                    "AffirmationView: Missing affirmationType in exercise metadata"
                )
                return
            }
            self.affirmations = AffirmationStore.shared.getAffirmationsByType(
                affirmationType: affirmationType,
                count: count
            )
        }
        .animation(.easeInOut, value: currentIndex)
        .fullScreenCover(isPresented: $isComplete) {
            ExerciseResultView(
                result: ExerciseResult(
                    isSuccess: true,
                    message: "Congratulations!",
                    motivation:
                        "Great job completing the affirmation exercise!",
                    exerciseId: exerciseId
                ),
                onDismiss: {
                    dismiss()
                }
            )
        }
    }
}

#Preview {
    AffirmationView(
        exerciseId: UUID(uuidString: "FEDCBA98-7654-3210-FEDC-BA9876543210")!
    )
}
