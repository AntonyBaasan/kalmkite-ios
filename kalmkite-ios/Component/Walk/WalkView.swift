//
//  WalkView.swift
//  kalmkite-ios
//
//  Created by antair on 10/17/25.
//

import SwiftUI

// Item to find/notice during walk
struct WalkItem: Identifiable {
    let id: Int
    let name: String
    let icon: String
    let color: Color
}

struct WalkView: View {
    @Environment(\.dismiss) private var dismiss
    
    let exerciseId: Int
    @State private var exercise: Exercise?
    @State private var selectedItems: Set<Int> = []
    @State private var showWalkSession = false
    
    // Things to find/notice while walking
    let items = [
        WalkItem(id: 0, name: "Something green", icon: "leaf.fill", color: .green),
        WalkItem(id: 1, name: "A sound from far away", icon: "ear.fill", color: .purple),
        WalkItem(id: 2, name: "Something moving", icon: "wind", color: .blue),
        WalkItem(id: 3, name: "A pleasant scent", icon: "nose.fill", color: .pink),
        WalkItem(id: 4, name: "Something soft", icon: "hand.raised.fill", color: .orange),
        WalkItem(id: 5, name: "A pattern or texture", icon: "square.grid.2x2", color: .indigo),
        WalkItem(id: 6, name: "Your breath", icon: "lungs.fill", color: .cyan),
        WalkItem(id: 7, name: "Natural light", icon: "sun.max.fill", color: .yellow),
        WalkItem(id: 8, name: "Something unexpected", icon: "sparkles", color: .red),
        WalkItem(id: 9, name: "A shadow", icon: "moon.fill", color: .gray)
    ]
    
    var body: some View {
        ZStack {
            // Background gradient
            LinearGradient(
                colors: [Color.green.opacity(0.3), Color.blue.opacity(0.2)],
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
                        .foregroundColor(.primary)
                    
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
                        .foregroundColor(.primary)
                    
                    Text("Select things to find while you walk")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .padding(.top, 20)
                .padding(.bottom, 30)
                
                // Selection counter
                HStack(spacing: 4) {
                    Text("\(selectedItems.count)")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.green)
                    Text("selected")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .padding(.bottom, 20)
                
                // Scrollable grid of circular buttons
                ScrollView {
                    LazyVGrid(columns: [
                        GridItem(.flexible(), spacing: 20),
                        GridItem(.flexible(), spacing: 20)
                    ], spacing: 20) {
                        ForEach(items) { item in
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
                    .padding(.bottom, 20)
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
        }
        .fullScreenCover(isPresented: $showWalkSession) {
            WalkSessionView(
                exerciseId: exerciseId,
                selectedItems: Array(selectedItems).compactMap { id in
                    items.first(where: { $0.id == id })
                }
            )
        }
    }
}

#Preview {
    WalkView(exerciseId: 5)
}
