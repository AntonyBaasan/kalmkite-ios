//
//  ExerciseLargeCard.swift
//  kalmkite-ios
//
//  Created by antair on 10/17/25.
//

import SwiftUI

struct ExerciseLargeCard: View {
    let exercise: Exercise
    @State private var isPressed = false
    @State private var defaultDurationSeconds = 120

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack(spacing: 16) {
                // Large icon circle
                ZStack {
                    Circle()
                        .fill(
                            LinearGradient(
                                colors: [
                                    colorForExercise.opacity(0.8),
                                    colorForExercise.opacity(0.6),
                                ],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: 50, height: 50)

                    Image(systemName: iconForExercise)
                        .font(.system(size: 32))
                        .foregroundColor(.white)
                }

                VStack(alignment: .leading, spacing: 6) {
                    // Exercise name
                    Text(exercise.name)
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(.darkGreen)

                    // Duration
                    HStack(spacing: 4) {
                        Image(systemName: "clock")
                            .font(.caption)
                        Text(durationString)
                            .font(.subheadline)
                    }
                    .foregroundColor(.darkGreen.opacity(0.8))
                }

                Spacer()
            }

            // Details/description
            Text(exercise.details)
                .font(.body)
                .foregroundColor(.darkGreen.opacity(0.9))
                .lineLimit(3)
                .multilineTextAlignment(.leading)

            // Arrow indicator at bottom
            HStack {
                Spacer()
                Image(systemName: "arrow.right.circle.fill")
                    .font(.title2)
                    .foregroundColor(colorForExercise)
            }
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.white)
                .shadow(
                    color: Color.black.opacity(isPressed ? 0.12 : 0.1),
                    radius: isPressed ? 8 : 12,
                    y: isPressed ? 4 : 6
                )
        )
        .scaleEffect(isPressed ? 0.97 : 1.0)
        .animation(
            .spring(response: 0.3, dampingFraction: 0.6),
            value: isPressed
        )
        .onLongPressGesture(
            minimumDuration: .infinity,
            maximumDistance: .infinity,
            pressing: { pressing in
                isPressed = pressing
            },
            perform: {}
        )
    }

    // Duration formatter
    private var durationString: String {
        
        if let durationStr = exercise.metadata["duration"], let duration = Int(durationStr) {
            let minutes = duration / 60
            if minutes < 1 {
                return "\(Int(duration))s"
            } else {
                return "\(minutes) min"
            }
        } else {
            let minutes = defaultDurationSeconds / 60
            return "\(minutes) min"
        }
    }

    // Icon based on exercise name/type
    private var iconForExercise: String {
        let lowercased = exercise.name.lowercased()

        if lowercased.contains("walk") {
            return "figure.walk"
        } else if lowercased.contains("breath") {
            return "wind"
        } else if lowercased.contains("focus") {
            return "target"
        } else if lowercased.contains("meditat") {
            return "leaf.fill"
        } else if lowercased.contains("relax") {
            return "sparkles"
        } else if lowercased.contains("stretch") {
            return "figure.flexibility"
        } else if lowercased.contains("sleep") {
            return "moon.stars.fill"
        } else if lowercased.contains("energy") {
            return "bolt.fill"
        } else if lowercased.contains("calm") {
            return "heart.fill"
        } else {
            return "star.fill"
        }
    }

    // Color based on exercise type
    private var colorForExercise: Color {
        let lowercased = exercise.name.lowercased()

        if lowercased.contains("walk") {
            return .green
        } else if lowercased.contains("breath") {
            return .cyan
        } else if lowercased.contains("focus") {
            return .indigo
        } else if lowercased.contains("meditat") {
            return .purple
        } else if lowercased.contains("relax") {
            return .mint
        } else if lowercased.contains("stretch") {
            return .orange
        } else if lowercased.contains("sleep") {
            return .blue
        } else if lowercased.contains("energy") {
            return .yellow
        } else if lowercased.contains("calm") {
            return .pink
        } else {
            return .green
        }
    }
}

#Preview {
    ExerciseLargeCard(
        exercise: Exercise(
            id: UUID(),
            questionId: QuestionId.workload,
            name: "Guided Breathing",
            details: "A 2-minute breathing exercise to help you reset.",
            status: ExerciseStatus.Active,
            exerciseType: ExerciseType.Breathing,
            metadata: [
                "duration": "120"
            ]
            
        )
    )
}
