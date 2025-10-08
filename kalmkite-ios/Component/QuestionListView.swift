//
//  QuestionListView.swift
//  kalmkite-ios
//
//  Created by antair on 10/6/25.
//

import SwiftUI

struct QuestionListView: View {
    
    @State var questions: [Question] = QuestionStore.shared.questions
        
    var body: some View {
        List {
            ForEach(questions) { question in
                HStack {
                    Text(question.text)
                }.onTapGesture {
                    print("Tapped on question: \(question.text) with connected exercises: \(question.connectedExercises)")


                }
            }
        }
    }
}

#Preview {
    QuestionListView()
}
