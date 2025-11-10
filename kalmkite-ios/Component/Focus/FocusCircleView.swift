import SwiftUI

struct FocusCircularView: View {
    @Environment(\.dismiss) private var dismiss

    let exerciseId: Int
    @State private var exercise: Exercise?
    @State private var remainingTime: TimeInterval = 0
    @State private var totalTime: TimeInterval = 0
    @State private var timer: Timer? = nil
    @State private var timeCompleted = false
    @State private var isComplete = false

    var body: some View {
        ZStack {
            // Background gradient
            LinearGradient(
                colors: [Color.darkGreen.opacity(0.8), Color.darkGreen.opacity(0.5)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            VStack {
                // Header
                HStack {
                    Spacer()

                    Text(exercise?.name ?? "Focus")
                        .font(.headline)
                        .foregroundColor(.white)

                    Spacer()
                }
                .padding()

                Spacer()

                // Circular timer
                ZStack {
                    Circle()
                        .stroke(Color.white.opacity(0.3), lineWidth: 20)

                    Circle()
                        .trim(from: 0, to: totalTime > 0 ? CGFloat(remainingTime / totalTime) : 0)
                        .stroke(
                            LinearGradient(
                                colors: [Color.white, Color.white.opacity(0.7)],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            ),
                            style: StrokeStyle(lineWidth: 20, lineCap: .round)
                        )
                        .rotationEffect(.degrees(-90))
                        .animation(.linear(duration: 1), value: remainingTime)

                    Text(timeString(from: remainingTime))
                        .font(.system(size: 50, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                }
                .frame(width: 250, height: 250)
                .padding(.bottom, 60)

                Spacer()

                // Done button
                if timeCompleted {
                    Button {
                        isComplete = true
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
                    .transition(.move(edge: .bottom).combined(with: .opacity))
                } else {
                    Text("Focus on your task to complete the timer")
                        .foregroundColor(.white.opacity(0.7))
                        .padding(.bottom, 40)
                        .transition(.move(edge: .top).combined(with: .opacity))
                }
            }
        }
        .onAppear {
            if let ex = ExerciseStore.shared.getExercise(by: exerciseId) {
                self.exercise = ex
                self.totalTime = ex.duration
                self.remainingTime = ex.duration
                startTimer()
            }
        }
        .animation(.easeInOut, value: isComplete)
        .fullScreenCover(isPresented: $isComplete) {
            ExerciseResultView(
                result: ExerciseResult(
                    isSuccess: true,
                    message: "Congratulations!",
                    motivation: "Great job completing the focus time!",
                    exerciseId: exerciseId
                ),
                onDismiss: {
                    dismiss()
                }
            )
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
                timeCompleted = true
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
    FocusCircularView(exerciseId: 4)
}
