//
//  WalkItemCard.swift
//  kalmkite-ios
//
//  Created by antair on 10/17/25.
//

import SwiftUI

// Card for each item during walk
struct WalkItemCard: View {
    let item: WalkItem
    let isCompleted: Bool

    var body: some View {
        HStack(spacing: 16) {
            // Icon circle
            ZStack {
                Circle()
                    .fill(isCompleted ? Color.white.opacity(0.3) : Color.white)
                    .frame(width: 50, height: 50)

                Image(
                    systemName: isCompleted
                        ? "checkmark.circle.fill" : item.icon
                )
                .font(.title3)
                .foregroundColor(isCompleted ? .white : item.color)
            }

            // Text
            Text(item.name)
                .font(.headline)
                .foregroundColor(.white)
                .strikethrough(isCompleted)
                .opacity(isCompleted ? 0.6 : 1.0)

            Spacer()
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(
                    isCompleted
                        ? Color.white.opacity(0.2) : Color.white.opacity(0.3)
                )
        )
    }
}

#Preview {
    WalkItemCard(
        item: WalkItem(
            id: 0,
            name: "Something green",
            icon: "leaf.fill",
            color: .green
        ),
        isCompleted: false
    )
}
