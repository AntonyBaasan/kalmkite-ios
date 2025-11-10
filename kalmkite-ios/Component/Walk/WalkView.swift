//
//  WalkView.swift
//  kalmkite-ios
//
//  Created by antair on 10/17/25.
//

import SwiftUI

struct WalkView: View {
    @Environment(\.dismiss) private var dismiss
    
    let exerciseId: Int
    @State private var exercise: Exercise?
    @State private var selectedItems: Set<Int> = []
    @State private var showWalkSession = false
    @State private var walkItems: [WalkItem] = []

    var body: some View {
        ZStack {
            // Background gradient
            LinearGradient(
                colors: [.darkGreen.opacity(0.8), .darkGreen.opacity(0.6)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            VStack(spacing: 0) {
                // Header
                HStack {
//                    Button {
//                        dismiss()
//                    } label: {
//                        Image(systemName: "xmark")
//                            .font(.title3)
//                            .foregroundColor(.primary)
//                    }
                    
                    Spacer()
                    
                    Text("Decompression Walk")
                        .font(.headline)
                        .foregroundColor(.white)
                    
                    Spacer()
                    
//                    Image(systemName: "xmark")
//                        .font(.title3)
//                        .foregroundColor(.clear)
                }
                .padding()
                
                // Title section
                VStack(spacing: 8) {
                    Text("What will you notice?")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                    
                    Text("Select things to find while you walk")
                        .font(.subheadline)
                        .foregroundColor(.white)
                }
                .padding(.top, 20)
                .padding(.bottom, 30)
                
                // Selection counter
                HStack(spacing: 4) {
                    Text("\(selectedItems.count)")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Text("selected")
                        .font(.subheadline)
                        .foregroundColor(.white)
                }
                .padding(.bottom, 20)
                
                // Scrollable grid of circular buttons
                ScrollView {
                    LazyVGrid(columns: [
                        GridItem(.flexible(), spacing: 20),
                        GridItem(.flexible(), spacing: 20)
                    ], spacing: 20) {
                        ForEach(walkItems) { item in
                            CircularItemButton(
                                item: item,
                                isSelected: selectedItems.contains(item.id)
                            )
                            .onTapGesture {
                                withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                                    if selectedItems.contains(item.id) {
                                        selectedItems.remove(item.id)
                                    } else {
                                        selectedItems.insert(item.id)
                                    }
                                }
                            }
                        }
                    }
                    .padding(.horizontal, 30)
                    .padding(.vertical, 20)
                }
                
                Spacer()
                
                // Begin button
                Button {
                    showWalkSession = true
                } label: {
                    Text(selectedItems.isEmpty ? "Select at least one thing" : "Begin Walk")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(selectedItems.isEmpty ? Color.green.opacity(Double(0.5)) : Color.green)
                        .cornerRadius(12)
                        .padding(.horizontal, 40)
                        .padding(.bottom, 40)
                }
                .disabled(selectedItems.isEmpty)
            }
        }
        .onAppear {
            if let ex = ExerciseStore.shared.getExercise(by: exerciseId) {
                self.exercise = ex
            }
            walkItems = WalkItemStore.shared.walkItems
        }
        .fullScreenCover(isPresented: $showWalkSession) {
            WalkSessionView(
                exerciseId: exerciseId,
                selectedItems: Array(selectedItems).compactMap { id in
                    walkItems.first(where: { $0.id == id })
                },
                onDismissAll: {
                    dismiss()
                }
            )
        }
    }
}

#Preview {
    WalkView(exerciseId: 5)
}
