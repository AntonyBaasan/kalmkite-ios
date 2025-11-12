//
//  WalkSessionView.swift
//  kalmkite-ios
//
//  Created by antair on 10/17/25.
//

import SwiftUI

// Walk session view with tap-to-complete items
struct WalkSessionView: View {
    @Environment(\.dismiss) private var dismiss

    let exerciseId: UUID
    let selectedItems: [WalkItem]
    let onDismissAll: () -> Void
    @State private var exercise: Exercise?
    @State private var remainingTime: TimeInterval = 0
    @State private var totalTime: TimeInterval = 0
    @State private var timer: Timer? = nil
    @State private var timeCompleted = false
    @State private var isComplete = false
    @State private var completedItems: Set<Int> = []

    var allItemsFound: Bool {
        completedItems.count == selectedItems.count
    }

    var body: some View {
        ZStack {
            // Background gradient
            LinearGradient(
                colors: [Color.darkGreen.opacity(0.8), Color.darkGreen.opacity(0.5)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            VStack(spacing: 0) {
                // Header
                HStack {
                    Spacer()

                    Text("Decompression Walk")
                        .font(.headline)
                        .foregroundColor(.white)

                    Spacer()
                }
                .padding()

                // Timer
                Text(timeString(from: remainingTime))
                    .font(
                        .system(size: 28, weight: .semibold, design: .rounded)
                    )
                    .foregroundColor(.white)
                    .padding(.top, 10)

                // Progress text
                Text("\(completedItems.count) of \(selectedItems.count) found")
                    .font(.subheadline)
                    .foregroundColor(.white.opacity(0.8))
                    .padding(.bottom, 30)

                // Items to find - tap when found
                ScrollView {
                    VStack(spacing: 16) {
                        ForEach(selectedItems) { item in
                            WalkItemCard(
                                item: item,
                                isCompleted: completedItems.contains(item.id)
                            )
                            .onTapGesture {
                                withAnimation(
                                    .spring(response: 0.4, dampingFraction: 0.7)
                                ) {
                                    if completedItems.contains(item.id) {
                                        completedItems.remove(item.id)
                                    } else {
                                        completedItems.insert(item.id)
                                    }
                                }
                            }
                        }
                    }
                    .padding(.horizontal, 30)
                }

                Spacer()

                // Done button
                if timeCompleted || allItemsFound {
                    Button {
                        isComplete = true
                    } label: {
                        Text(
                            allItemsFound
                                ? "All Found! Complete Walk"
                                : "Time's Up - Complete Walk"
                        )
                        .font(.headline)
                        .foregroundColor(.darkGreen)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(12)
                        .padding(.horizontal, 40)
                        .padding(.bottom, 40)
                    }
                    .transition(.move(edge: .bottom).combined(with: .opacity))
                } else {
                    Text("Tap items when you find them")
                        .foregroundColor(.white.opacity(0.7))
                        .padding(.bottom, 40)
                }
            }
        }
        .onAppear {
            if let ex = ExerciseStore.shared.getExercise(by: exerciseId) {
                self.exercise = ex
                self.totalTime = TimeInterval(ex.duration)
                self.remainingTime = TimeInterval(ex.duration)
                startTimer()
            }
        }
        .fullScreenCover(isPresented: $isComplete) {
            ExerciseResultView(
                result: ExerciseResult(
                    isSuccess: allItemsFound,
                    message: allItemsFound ? "Amazing!" : "Great Walk!",
                    motivation: allItemsFound
                        ? "You found everything and stayed present!"
                        : "You stayed mindful during your walk.",
                    exerciseId: exerciseId
                ),
                onDismiss: {
                    dismiss()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        onDismissAll()
                    }
                }
            )
        }
        .onDisappear {
            timer?.invalidate()
        }
    }

    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if remainingTime > 0 {
                remainingTime -= 1
            } else {
                timer?.invalidate()
                timeCompleted = true
            }
        }
    }

    private func timeString(from time: TimeInterval) -> String {
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}

#Preview {
    WalkSessionView(
        exerciseId: UUID(uuidString: "12345678-90AB-CDEF-1234-567890ABCDEF")!,
        selectedItems: [
            WalkItem(
                id: 0,
                name: "Something green",
                icon: "leaf.fill",
                color: .green
            ),
            WalkItem(
                id: 1,
                name: "A sound from far away",
                icon: "ear.fill",
                color: .purple
            ),
            WalkItem(
                id: 2,
                name: "Something moving",
                icon: "wind",
                color: .blue
            ),
            WalkItem(
                id: 3,
                name: "A pleasant scent",
                icon: "nose.fill",
                color: .pink
            ),
            WalkItem(
                id: 4,
                name: "Something soft",
                icon: "hand.raised.fill",
                color: .orange
            ),
        ],
        onDismissAll: { /* do nothings */  }
    )
}
