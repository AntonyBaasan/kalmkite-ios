//
//  AffirmationView.swift
//  kalmkite-ios
//
//  Created by antair on 10/15/25.
//

import SwiftUI

import SwiftUI

struct FocusView: View {
    @Environment(\.dismiss) private var dismiss

    let exerciseId: Int
    @State private var exercise: Exercise?
    @State private var remainingTime: TimeInterval = 0
    @State private var totalTime: TimeInterval = 0
    @State private var timer: Timer? = nil
    @State private var isComplete = false

    private let barWidth: CGFloat = 40

    var body: some View {
        ZStack {
            // Background gradient
            LinearGradient(
                colors: [Color.green.opacity(0.5), Color.green.opacity(0.2)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            ).ignoresSafeArea()

            VStack {
                // Header
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .font(.title3)
                            .foregroundColor(.white)
                    }

                    Spacer()

                    Text(exercise?.name ?? "Focus")
                        .font(.headline)
                        .foregroundColor(.white)

                    Spacer()

                    // Invisible button for balance
                    Image(systemName: "xmark")
                        .font(.title3)
                        .foregroundColor(.clear)
                }
                .padding()

                Spacer()

                // Timer text
                Text(timeString(from: remainingTime))
                    .font(.system(size: 60, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                    .padding(.bottom, 40)

                // Vertical progress bar
                ZStack(alignment: .bottom) {
                    Capsule()
                        .fill(Color.white.opacity(0.3))
                        .frame(width: barWidth, height: 300)

                    Capsule()
                        .fill(
                            LinearGradient(
                                colors: [Color.white, Color.white.opacity(0.7)],
                                startPoint: .bottom,
                                endPoint: .top
                            )
                        )
                        .frame(
                            width: barWidth,
                            height: CGFloat(remainingTime / totalTime) * 300
                        )
                        .animation(.linear(duration: 0.2), value: remainingTime)
                }
                .padding(.bottom, 60)

                Spacer()

                // Done button
                if isComplete {
                    Button {
                        dismiss()
                    } label: {
                        Text("Done")
                            .font(.headline)
                            .foregroundColor(.green)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(12)
                            .padding(.horizontal, 40)
                            .padding(.bottom, 40)
                    }
                }
            }
        }
        .onAppear {
            // Load exercise duration
            if let ex = ExerciseStore.shared.getExercise(by: exerciseId) {
                self.exercise = ex
                self.totalTime = ex.duration
                self.remainingTime = ex.duration
                startTimer()
            }
        }
        .onDisappear {
            timer?.invalidate()
        }
    }

    // Timer logic
    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if remainingTime > 0 {
                remainingTime -= 1
            } else {
                timer?.invalidate()
                isComplete = true
            }
        }
    }

    // Format TimeInterval as MM:SS
    private func timeString(from time: TimeInterval) -> String {
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}


#Preview {
    FocusView(exerciseId: 4)
}
