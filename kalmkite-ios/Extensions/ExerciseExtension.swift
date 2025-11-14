//
//  ExerciseExtension.swift
//  kalmkite-ios
//
//  Created by antair on 11/11/25.
//

import SwiftUI

extension Exercise {

    var duration: Int {
        guard let durationStr = self.metadata["duration"],
            let durationInt = Int(durationStr)
        else {
            return 120  // default duration in seconds
        }
        return durationInt
    }
    
    var instruction: String? {
        return self.metadata["instruction"]
    }
    
    var durationAsTimeInterval: TimeInterval {
        return TimeInterval(self.duration)
    }
}
