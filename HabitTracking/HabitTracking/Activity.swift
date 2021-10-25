//
//  Activity.swift
//  HabitTracking
//
//  Created by Mariana Yamamoto on 10/25/21.
//

import Foundation
import SwiftUI

class Activities: ObservableObject {
    @Published var activities: [Activity]

    init(activities: [Activity]) {
        self.activities = activities
    }
}

struct Activity: Codable, Identifiable {
    let id: String
    let title: String
    let description: String
}
