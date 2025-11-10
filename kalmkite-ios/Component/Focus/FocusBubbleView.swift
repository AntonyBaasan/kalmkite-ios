//
//  kalmkite-ios
//
//  Created by antair on 10/15/25.
//

import SwiftUI

struct FocusBubbleView: View {
    @Environment(\.dismiss) private var dismiss

    let exerciseId: Int
    @State private var exercise: Exercise?
    @State private var remainingTime: TimeInterval = 0
    @State private var totalTime: TimeInterval = 0
    @State private var timer: Timer? = nil
    @State private var isComplete = false

    @State private var bubbleScale: CGFloat = 1.0

    var body: some View {
        ZStack {
            // Dimmed background
            Color.black.opacity(0.8)
                .ignoresSafeArea()

            VStack {
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

                    Text(exercise?.name ?? "Focus")
                        .font(.headline)
                        .foregroundColor(.white)

                    Spacer()

//                    Image(systemName: "xmark")
//                        .font(.title3)
//                        .foregroundColor(.clear)
                }
                .padding()

                Spacer()

                // Floating bubble
                ZStack {
                    Circle()
                        .fill(
                            LinearGradient(
                                colors: [Color.darkGreen.opacity(0.7), Color.darkGreen.opacity(0.4)],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                        .frame(width: 200 * bubbleScale, height: 200 * bubbleScale)
                        .shadow(color: Color.green.opacity(0.5), radius: 20, x: 0, y: 0)

                    // Countdown timer inside bubble
                    Text(timeString(from: remainingTime))
                        .font(.system(size: 40, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                }
                .animation(.linear(duration: 1), value: bubbleScale)

                Spacer()

                if isComplete {
                    Button {
                        dismiss()
                    } label: {
                        Text("Done")
                            .font(.headline)
                            .foregroundColor(.darkGreen)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(12)
                            .padding(.horizontal, 40)
                            .padding(.bottom, 40)
                    }
                } else {
                    Text("Focus on the bubble and breathe...")
                        .foregroundColor(.white.opacity(0.7))
                        .padding(.bottom, 40)
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
                // Shrink bubble gradually
                bubbleScale = CGFloat(0.5 + 0.5 * remainingTime / totalTime)
            } else {
                timer?.invalidate()
                isComplete = true
                bubbleScale = 0.5
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
