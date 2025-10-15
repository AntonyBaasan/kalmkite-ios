//
//  Test.swift
//  kalmkite-ios
//
//  Created by antair on 10/14/25.
//

import Combine
import SwiftUI

struct TestView: View {
    @State private var currentTime = Date.now
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var leftTime = 10

    var body: some View {
        VStack {
            Text("\(leftTime)")
            Text("\(currentTime)")
                .onReceive(timer) {
                    input in
                    currentTime = input
                    
                    if leftTime > 0 {
                        leftTime -= 1
                    } else {
                        timer.upstream.connect().cancel()
                    }
                }
        }
    }
}
