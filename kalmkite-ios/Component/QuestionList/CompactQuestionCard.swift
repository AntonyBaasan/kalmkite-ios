//
//  CompactQuestionCard.swift
//  kalmkite-ios
//
//  Created by antair on 11/10/25.
//

import SwiftUI

struct CompactQuestionCard: View {
    let question: Question
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // Icon
            Image(systemName: question.icon)
                .font(.system(size: 24))
                .foregroundColor(.white)
                .frame(width: 40, height: 40)
                .background(Color.white.opacity(0.2))
                .clipShape(Circle())
            
            // Title
            Text(question.text)
                .font(.system(size: 15, weight: .semibold))
                .foregroundColor(.white)
                .lineLimit(2)
                .multilineTextAlignment(.leading)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white.opacity(0.15))
                .shadow(color: .black.opacity(0.1), radius: 8, y: 4)
        )
    }
}
