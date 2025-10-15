//
//  GuidedBreathing.swift
//  kalmkite-ios
//
//  Created by antair on 10/14/25.
//

import SwiftUI

struct GuidedBreathing: View {
    @Environment(\.dismiss) private var dismiss
    
    let exerciseId: Int
    @State private var exercise: Exercise?
    @State private var secondsLeft: Int = 0
    @State private var isBreathingActive = false
    @State private var currentPhase = -1
    @State private var phaseProgress: Int = 0
    // Progress from 0 to 1 for the entire exercise duration
    @State private var progress: CGFloat = 0
    @State private var timer: Timer?
    @State private var isComplete: Bool = false

    private let circleMaxSize: CGFloat = 210
    private let circleMinSize: CGFloat = 160
    private let phases = ["Inhale", "Hold", "Exhale", "Hold"]
    private var phaseDuration: TimeInterval { 4.0 }
    private var startDuration: TimeInterval { 3.0 }

    var body: some View {
        ZStack {
            // Soft gradient background
            LinearGradient(
                colors: [Color.blue.opacity(0.1), Color.purple.opacity(0.1)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            VStack(spacing: 40) {
                Spacer()

                // Exercise title
                Text(exercise?.name ?? "Loading...")
                    .font(.system(size: 28, weight: .light))
                    .foregroundColor(.primary)

                // Breathing circle animation
                ZStack {
                    // Outer ring
                    Circle()
                        .stroke(Color.blue.opacity(0.2), lineWidth: 3)
                        .frame(width: 240, height: 240)

                    // Animated progress ring
                    Circle()
                        .trim(from: 0, to: progress)
                        .stroke(
                            LinearGradient(
                                colors: [.blue, .purple],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            ),
                            style: StrokeStyle(lineWidth: 3, lineCap: .round)
                        )
                        .frame(width: 240, height: 240)
                        .rotationEffect(.degrees(-90))
                        .animation(
                            .linear(duration: 1.0),
                            value: progress
                        )

                    // Inner circle that scales
                    Circle()
                        .fill(
                            LinearGradient(
                                colors: [
                                    .blue.opacity(0.3), .purple.opacity(0.3),
                                ],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(
                            width: self.breathingCircleSize,
                            height: self.breathingCircleSize
                        )
                        .animation(
                            .easeInOut(duration: phaseDuration),
                            value: currentPhase
                        )

                    // Phase text
                    VStack(spacing: 8) {
                        Text(isBreathingActive ? phases[currentPhase] : "Ready")
                            .font(.system(size: 24, weight: .thin))
                            .foregroundColor(.primary)

                        Text("\(Int(phaseProgress))s")
                            .font(.system(size: 16, weight: .light))
                            .foregroundColor(.secondary)
                        //                        Text("\(Double(progress))")
                        //                            .font(.system(size: 16, weight: .light))
                        //                            .foregroundColor(.secondary)
                        //                        Text("\(Double(secondsLeft))")
                        //                            .font(.system(size: 16, weight: .light))
                        //                            .foregroundColor(.secondary)
                    }
                }

                // Details
                if let details = exercise?.details {
                    Text(details)
                        .font(.system(size: 16, weight: .light))
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 40)
                }

                Spacer()

                // Start/Stop button
                Button(action: toggleBreathing) {
                    Text(isBreathingActive ? "Stop" : "Start")
                        .font(.system(size: 18, weight: .medium))
                        .foregroundColor(.white)
                        .frame(width: 200, height: 56)
                        .background(
                            LinearGradient(
                                colors: isBreathingActive
                                    ? [.red.opacity(0.8), .orange.opacity(0.8)]
                                    : [.blue, .purple],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .cornerRadius(28)
                        .shadow(
                            color: .black.opacity(0.1),
                            radius: 10,
                            x: 0,
                            y: 5
                        )
                }
                Spacer()
            }
        }
        .onAppear {
            exercise = ExerciseStore.shared.getExercise(by: self.exerciseId)
            self.secondsLeft = Int(exercise?.duration ?? 0)
        }
        .onDisappear {
            stopBreathing()
        }.fullScreenCover(isPresented: $isComplete) {
            // TODO: improve success criteria
            ExerciseResultView(
                result: ExerciseResult(
                    isSuccess: secondsLeft < 5,
                    message: "Congragulations!",
                    motivation: "Great job completing the breathing exercise!",
                    exerciseId: exerciseId,
                ),
                onDismiss: {
                    dismiss()
                }
            )
        }
        .presentationDetents([.medium, .large])
    }

    private func toggleBreathing() {
        if isBreathingActive {
            stopBreathing()
        } else {
            startBreathing()
        }
    }

    private func startBreathing() {
        isBreathingActive = true
        currentPhase = 0
        phaseProgress = 0
        progress = 0
        secondsLeft = Int(exercise?.duration ?? 0)

        timer = Timer.scheduledTimer(
            withTimeInterval: 1,
            repeats: true
        ) { _ in
            phaseProgress += 1

            if phaseProgress >= Int(phaseDuration) {
                phaseProgress = 0
                currentPhase = (currentPhase + 1) % 4
            }

            secondsLeft -= 1
            if secondsLeft <= 0 {
                stopBreathing()
            }

            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                withAnimation {
                    progress = CGFloat(
                        1 - Double(secondsLeft)
                            / Double(exercise?.duration ?? 1)
                    )
                }
            }
        }
    }

    private func stopBreathing() {
        isBreathingActive = false
        timer?.invalidate()
        timer = nil
        currentPhase = -1
        isComplete = true
    }

    private var breathingCircleSize: CGFloat {

        if !isBreathingActive {
            return self.circleMinSize
        }

        switch currentPhase {
        case 0, 1: return self.circleMaxSize
        case 2, 3: return self.circleMinSize
        default: return 150
        }

    }
}

#Preview {
    GuidedBreathing(exerciseId: 1)
}
