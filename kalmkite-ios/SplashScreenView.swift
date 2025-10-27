//
//  SplashScreenView.swift
//  kalmkite-ios
//
//  Created by antair on 10/26/25.
//

import SwiftUI

struct SplashScreenView: View {
    @Binding var size: Double
    @Binding var opacity: Double
    
    var body: some View {
        ZStack {
            // Background gradient
//            LinearGradient(
//                gradient: Gradient(colors: [Color.blue, Color.purple]),
//                startPoint: .topLeading,
//                endPoint: .bottomTrailing
//            )
//            .ignoresSafeArea()
            
            // Content
            VStack(spacing: 20) {
                // Logo/Icon
                Image(systemName: "star.fill")
                    .font(.system(size: 80))
                    .foregroundColor(.green)
                
                // App Name
                Text("KalmKite")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.green)
                
                // Optional tagline
                Text("Welcome")
                    .font(.title3)
                    .foregroundColor(.green.opacity(0.8))
            }
            .scaleEffect(size)
            .opacity(opacity)
        }
    }
}

#Preview {
//    SplashScreenView(size: $1, opacity: $1)
    SplashScreenView(size: .constant(1.0), opacity: .constant(1.0))
}
