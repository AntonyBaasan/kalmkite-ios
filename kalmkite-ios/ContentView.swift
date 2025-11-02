//
//  ContentView.swift
//  kalmkite-ios
//
//  Created by antair on 10/4/25.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]

    @State private var splashScreenDuration = 2.0
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5

    init() {
        // For inline title
        let appearance = UINavigationBarAppearance()
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]

        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }

    var body: some View {
        QuestionListView()
        //        if isActive {
        //            QuestionListView()
        //        } else {
        //            SplashScreenView(size: $size, opacity: $opacity)
        //                .onAppear {
        //                    withAnimation(.easeIn(duration: splashScreenDuration)) {
        //                        self.size = 0.9
        //                        self.opacity = 1.0
        //                    }
        //
        //                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
        //                        withAnimation {
        //                            self.isActive = true
        //                        }
        //                    }
        //                }
        //        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
