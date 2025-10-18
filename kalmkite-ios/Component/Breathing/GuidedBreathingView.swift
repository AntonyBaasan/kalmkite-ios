//
//  GuidedBreathingView 2.swift
//  kalmkite-ios
//
//  Created by antair on 10/17/25.
//

import SwiftUI

struct GuidedBreathingView: View {
    @Environment(\.dismiss) private var dismiss

    let exerciseId: Int
    @State private var exercise: Exercise?
    @State private var secondsLeft: Int = 0
    @State private var isBreathingActive = false
    @State private var currentPhase = -1
    @State private var phaseProgress: Int = 0
    @State private var progress: CGFloat = 0
    @State private var timer: Timer?
    @State private var isComplete: Bool = false

    private let circleMaxSize: CGFloat = 230
    private let circleMinSize: CGFloat = 180
    private let phases = ["Inhale", "Hold", "Exhale", "Hold"]
    private var phaseDuration: TimeInterval { 4.0 }

    var body: some View {
        ZStack {
            // Background gradient - same as FocusView
            LinearGradient(
                colors: [Color.green.opacity(0.8), Color.green.opacity(0.5)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            VStack {
                // Header
                HStack {
                    Spacer()

                    Text(exercise?.name ?? "Breathing")
                        .font(.headline)
                        .foregroundColor(.white)

                    Spacer()
                }
                .padding()

                Spacer()

                // Breathing circle animation
                ZStack {
                    // Outer ring (background)
                    Circle()
                        .stroke(Color.white.opacity(0.3), lineWidth: 20)
                        .frame(width: 250, height: 250)

                    // Animated progress ring
                    Circle()
                        .trim(from: 0, to: progress)
                        .stroke(
                            LinearGradient(
                                colors: [
                                    Color.white, Color.white.opacity(0.7),
                                ],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            ),
                            style: StrokeStyle(lineWidth: 20, lineCap: .round)
                        )
                        .frame(width: 250, height: 250)
                        .rotationEffect(.degrees(-90))
                        .animation(.linear(duration: 1.0), value: progress)

                    // Inner animated breathing circle
                    Circle()
                        .fill(Color.white.opacity(0.3))
                        .frame(
                            width: breathingCircleSize,
                            height: breathingCircleSize
                        )
                        .animation(
                            .easeInOut(duration: phaseDuration),
                            value: breathingCircleSize
                        )

                    // Phase text in center
                    VStack(spacing: 8) {
                        Text(phaseText)
                            .font(
                                .system(
                                    size: 32,
                                    weight: .semibold,
                                    design: .rounded
                                )
                            )
                            .foregroundColor(.white)

                        if isBreathingActive {
                            Text("\(phaseProgress)s")
                                .font(.system(size: 18, weight: .medium))
                                .foregroundColor(.white.opacity(0.8))
                        }
                    }
                }
                .padding(.bottom, 40)

                // Time remaining
                Text(timeString(from: TimeInterval(secondsLeft)))
                    .font(
                        .system(size: 24, weight: .semibold, design: .rounded)
                    )
                    .foregroundColor(.white)
                    .padding(.bottom, 20)

                // Details
                if let details = exercise?.details {
                    Text(details)
                        .font(.body)
                        .foregroundColor(.white.opacity(0.9))
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 40)
                        .transition(.opacity)
                }

                Spacer()

                // Start/Done button
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
                    .transition(.move(edge: .bottom).combined(with: .opacity))
                } else {
                    Button(action: toggleBreathing) {
                        Text(isBreathingActive ? "Close" : "Start")
                            .font(.headline)
                            .foregroundColor(
                                isBreathingActive
                                    ? Color.green
                                    : Color.white
                            )
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(
                                isBreathingActive
                                    ? Color.white
                                    : Color.white.opacity(0.2)
                            )
                            .cornerRadius(12)
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.white, lineWidth: 2)
                            )
                            .padding(.horizontal, 40)
                            .padding(.bottom, 40)
                    }
                }
            }
        }
        .animation(.easeInOut, value: isComplete)
        .onAppear {
            exercise = ExerciseStore.shared.getExercise(by: exerciseId)
            secondsLeft = Int(exercise?.duration ?? 0)
        }
        .onDisappear {
            stopBreathing()
        }
        .fullScreenCover(isPresented: $isComplete) {
            ExerciseResultView(
                result: ExerciseResult(
                    isSuccess: true,
                    message: "Well Done!",
                    motivation: "You completed your breathing exercise!",
                    exerciseId: exerciseId
                ),
                onDismiss: {
                    dismiss()
                }
            )
        }
    }

    private var phaseText: String {
        if !isBreathingActive || currentPhase < 0
            || currentPhase >= phases.count
        {
            return "Ready"
        }
        return phases[currentPhase]
    }

    private func toggleBreathing() {
        if isBreathingActive {
//            stopBreathing()
            dismiss()
        } else {
            startBreathing()
        }
    }

    private func startBreathing() {
        isBreathingActive = true
        phaseProgress = 0
        progress = 0
        secondsLeft = Int(exercise?.duration ?? 0)
        currentPhase = 0

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

            withAnimation(.linear(duration: 1.0)) {
                progress = CGFloat(
                    1 - Double(secondsLeft) / Double(exercise?.duration ?? 1)
                )
            }

            if secondsLeft <= 0 {
                stopBreathing()
            }
        }
    }

    private func stopBreathing() {
        isBreathingActive = false
        timer?.invalidate()
        timer = nil
        currentPhase = -1

        if secondsLeft <= 0 {
            isComplete = true
        }
    }

    private var breathingCircleSize: CGFloat {
        if !isBreathingActive {
            return circleMinSize
        }

        switch currentPhase {
        case 0, 1: return circleMaxSize  // Inhale & Hold (full)
        case 2, 3: return circleMinSize  // Exhale & Hold (small)
        default: return circleMinSize
        }
    }

    private func timeString(from time: TimeInterval) -> String {
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}
