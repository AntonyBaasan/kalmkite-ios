//
//  ExerciseResultView.swift
//  kalmkite-ios
//
//  Created by antair on 10/14/25.
//

import ConfettiSwiftUI
import SwiftUI

struct ExerciseResultView: View {
    @State var result: ExerciseResult
    @State private var trigger: Int = 0
    @State private var showContent = false
    @State private var showButton = false
    var onDismiss: (() -> Void)
    
    var body: some View {
        ZStack {
            // Background gradient
            LinearGradient(
                colors: result.isSuccess
                    ? [Color.green.opacity(0.8), Color.green.opacity(0.5)]
                    : [Color.blue.opacity(0.8), Color.blue.opacity(0.5)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            VStack(spacing: 0) {
                Spacer()
                
                // Success icon
                if showContent {
                    ZStack {
                        Circle()
                            .fill(Color.white.opacity(0.2))
                            .frame(width: 120, height: 120)
                        
                        Circle()
                            .fill(Color.white)
                            .frame(width: 100, height: 100)
                        
                        Image(systemName: result.isSuccess ? "checkmark" : "star.fill")
                            .font(.system(size: 50, weight: .bold))
                            .foregroundColor(result.isSuccess ? .green : .blue)
                    }
                    .scaleEffect(showContent ? 1.0 : 0.5)
                    .opacity(showContent ? 1.0 : 0.0)
                    .animation(.spring(response: 0.6, dampingFraction: 0.6), value: showContent)
                    .padding(.bottom, 40)
                }
                
                // Message
                Text(result.message)
                    .font(.system(size: 36, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 40)
                    .offset(y: showContent ? 0 : 20)
                    .opacity(showContent ? 1.0 : 0.0)
                    .animation(.easeOut(duration: 0.5).delay(0.2), value: showContent)
                
                Spacer()
                    .frame(height: 60)
                
                // Motivation text
                Text(result.motivation)
                    .font(.title3)
                    .fontWeight(.medium)
                    .foregroundColor(.white.opacity(0.9))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 40)
                    .offset(y: showContent ? 0 : 20)
                    .opacity(showContent ? 1.0 : 0.0)
                    .animation(.easeOut(duration: 0.5).delay(0.4), value: showContent)
                
                Spacer()
                
                // Done button
                if showButton {
                    Button {
                        onDismiss()
                    } label: {
                        Text("Done")
                            .font(.headline)
                            .foregroundColor(result.isSuccess ? .green : .blue)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(16)
                            .shadow(color: Color.black.opacity(0.1), radius: 10, y: 5)
                    }
                    .padding(.horizontal, 40)
                    .padding(.bottom, 40)
                    .scaleEffect(showButton ? 1.0 : 0.9)
                    .opacity(showButton ? 1.0 : 0.0)
                    .animation(.spring(response: 0.5, dampingFraction: 0.7), value: showButton)
                }
            }
//            .confettiCannon(trigger: $trigger)
            .confettiCannon(
                trigger: $trigger,
                num: 50,
                confettis: [.text("🎉"), .text("✨"), .text("❤️"), .text("⭐")],
                confettiSize: 20,
                rainHeight: 600,
                radius: 400
            )
        }
        .onAppear {
            // Show content immediately with animation
            withAnimation {
                showContent = true
            }
            
            // Show button after 1 second
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                withAnimation {
                    showButton = true
                }
            }
            
            // Trigger confetti after a short delay
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                trigger += 1
            }
        }
    }
}
#Preview {
    ExerciseResultView(
        result: ExerciseResult(
            isSuccess: true,
            message: "Congragulations!",
            motivation: "Great job completing the breathing exercise!",
            exerciseId: 1
        ),
        onDismiss: {
            print("Dismissed")
        }
    )
}
