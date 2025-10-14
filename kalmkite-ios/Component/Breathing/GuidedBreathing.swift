//
//  GuidedBreathing.swift
//  kalmkite-ios
//
//  Created by antair on 10/14/25.
//

import SwiftUI

struct GuidedBreathing: View {
    let exerciseId: Int
    @State private var exercise: Exercise?
    @State private var isBreathingActive = false
    @State private var currentPhase = 0
    @State private var progress: CGFloat = 0
    @State private var timer: Timer?

    private let phases = ["Inhale", "Hold", "Exhale", "Hold"]
    private var phaseDuration: TimeInterval { 4.0 }

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
                            .linear(duration: exercise?.duration ?? 0),
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
                            .font(.system(size: 32, weight: .thin))
                            .foregroundColor(.primary)

                        Text("\(Int(phaseDuration))s")
                            .font(.system(size: 16, weight: .light))
                            .foregroundColor(.secondary)
                        Text("\(Int(currentPhase))s")
                            .font(.system(size: 16, weight: .light))
                            .foregroundColor(.secondary)
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
        }
        .onDisappear {
            stopBreathing()
        }
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
        progress = 0

        timer = Timer.scheduledTimer(
            withTimeInterval: phaseDuration,
            repeats: true
        ) { _ in
            withAnimation {
                progress = 0
            }

            currentPhase = (currentPhase + 1) % 4

            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                withAnimation {
                    progress = 1.0
                }
            }
        }

        // Start first animation
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            withAnimation {
                progress = 1.0
            }
        }
    }

    private func stopBreathing() {
        isBreathingActive = false
        timer?.invalidate()
        timer = nil
        progress = 0
        currentPhase = 0
    }

    private var breathingCircleSize: CGFloat {

        if !isBreathingActive {
            return 120
        }
        
        switch currentPhase {
        case 0: return 180
        case 1: return 180
        case 2: return 120
        case 3: return 120
        default: return 120
        }

    }
}

#Preview {
    GuidedBreathing(exerciseId: 1)
}
