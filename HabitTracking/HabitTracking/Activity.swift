    //
    //  Activity.swift
    //  HabitTracking
    //
    //  Created by Mariana Yamamoto on 10/25/21.
    //

import Foundation
import SwiftUI

class Activities: ObservableObject {
    @Published var activities = [Activity]() {
        didSet {
            let encoder = JSONEncoder()

            if let encoded = try? encoder.encode(activities) {
                UserDefaults.standard.set(encoded, forKey: "Activities")
            }
        }
    }

    init() {
        if let items = UserDefaults.standard.data(forKey: "Activities") {
            let decoder = JSONDecoder()

            if let decoded = try? decoder.decode([Activity].self, from: items) {
                self.activities = decoded
            } else {
                self.activities = []
            }
        } else {
            self.activities = []
        }
    }
}

struct Activity: Codable, Identifiable {
    var id: String = UUID().uuidString
    let title: String
    let description: String
    var count: Int
}
