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
        NavigationStack {
            Text("Select a question to explore related exercises:")
                .font(.headline)
                .padding()
            ForEach(questions) { question in
                HStack {
                    NavigationLink(destination:ExerciseListView(exerciseIDs: question.connectedExercises)) {
                        
                        Text(question.text)
                    }
                }.onTapGesture {
                    print("Tapped on question: \(question.text) with connected exercises: \(question.connectedExercises)")


                }
            }
            .navigationTitle("Home")
        }
    }
}

#Preview {
    QuestionListView()
}
