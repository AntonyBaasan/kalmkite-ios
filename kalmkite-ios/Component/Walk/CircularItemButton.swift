//
//  CircularItemButton.swift
//  kalmkite-ios
//
//  Created by antair on 10/17/25.
//

import SwiftUI

// Circular button for each item
struct CircularItemButton: View {
    let item: WalkItem
    let isSelected: Bool
    
    var body: some View {
        VStack(spacing: 12) {
            ZStack {
                // Outer ring when selected
                if isSelected {
                    Circle()
                        .stroke(item.color, lineWidth: 3)
                        .frame(width: 100, height: 100)
                        .scaleEffect(1.1)
                }
                
                // Main circle
                Circle()
                    .fill(isSelected ? item.color : Color.white)
                    .frame(width: 90, height: 90)
                    .shadow(color: isSelected ? item.color.opacity(0.4) : Color.black.opacity(0.1), radius: isSelected ? 12 : 6)
                
                // Icon
                Image(systemName: item.icon)
                    .font(.system(size: 32))
                    .foregroundColor(isSelected ? .white : item.color)
                
                // Checkmark when selected
                if isSelected {
                    VStack {
                        HStack {
                            Spacer()
                            Image(systemName: "checkmark.circle.fill")
                                .font(.title3)
                                .foregroundColor(.white)
                                .background(Circle().fill(item.color).padding(2))
                        }
                        Spacer()
                    }
                    .frame(width: 90, height: 90)
                }
            }
            .scaleEffect(isSelected ? 1.05 : 1.0)
            
            // Label
            Text(item.name)
                .font(.caption)
                .fontWeight(isSelected ? .semibold : .regular)
                .foregroundColor(.primary)
                .multilineTextAlignment(.center)
                .frame(height: 32)
                .lineLimit(2)
        }
        .frame(width: 120)
    }
}

#Preview {
    CircularItemButton(
        item: WalkItem(
            id: 0,
            name: "Something green",
            icon: "leaf.fill",
            color: .green
        ),
//        isSelected: false
        isSelected: true
    )
}

