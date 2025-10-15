//
//  ExerciseResultView.swift
//  kalmkite-ios
//
//  Created by antair on 10/14/25.
//

import SwiftUI

struct ExerciseResultView: View {
    @State var result: ExerciseResult
    var onDismiss: (() -> Void)
    
    var body: some View {
        VStack {
            Spacer()
            Text(result.message)
                .font(.largeTitle)
            Spacer()
            Text(result.motivation)
                .font(.title2)
            Spacer()
            Button("Done") {
                onDismiss()
            }
            Spacer()
        }
    }
}

#Preview {
    ExerciseResultView(result: ExerciseResult(
        isSuccess: true,
        message: "Congragulations!",
        motivation: "Great job completing the breathing exercise!",
        exerciseId: 1
    ),onDismiss : {
        print("Dismissed")
    })
}
