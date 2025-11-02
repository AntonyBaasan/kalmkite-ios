//
//  QuestionCard.swift
//  kalmkite-ios
//
//  Created by antair on 10/17/25.
//

import SwiftUI


struct QuestionCard: View {
    let question: Question
    @State private var isPressed = false
    
    var body: some View {
        HStack(spacing: 16) {
            // Icon circle
            ZStack {
                Circle()
                    .fill(
                        LinearGradient(
                            colors: [
                                Color.green.opacity(0.6),
                                Color.green.opacity(0.4)
                            ],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 50, height: 50)
                
                Image(systemName: question.icon)
                    .font(.title3)
                    .foregroundColor(.white)
            }
            
            // Question text
            Text(question.text)
                .font(.body)
                .fontWeight(.medium)
                .foregroundColor(.green)
                .multilineTextAlignment(.leading)
                .lineLimit(2)
            
            Spacer()
            
            // Chevron
            Image(systemName: "chevron.right")
                .font(.body)
                .foregroundColor(.secondary)
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white)
                .shadow(
                    color: Color.black.opacity(isPressed ? 0.1 : 0.08),
                    radius: isPressed ? 4 : 8,
                    y: isPressed ? 2 : 4
                )
        )
        .scaleEffect(isPressed ? 0.98 : 1.0)
        .animation(.spring(response: 0.3, dampingFraction: 0.6), value: isPressed)
        .onLongPressGesture(minimumDuration: .infinity, maximumDistance: .infinity, pressing: { pressing in
            isPressed = pressing
        }, perform: {})
    }
}

#Preview {
    QuestionCard(question: Question(
        id: 2,
        text: "Pre-presentation anxiety",
        icon: "chart.bar.fill",
        connectedExercises: [1, 3, 6]
    ),)
}
