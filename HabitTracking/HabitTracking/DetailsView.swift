//
//  EditView.swift
//  HabitTracking
//
//  Created by Mariana Yamamoto on 10/25/21.
//

import SwiftUI

struct EditView: View {
    @ObservedObject var activities: Activities
    @State private var title: String = ""
    @State private var description: String = ""

    var body: some View {
        NavigationView {
            Form {
                TextField("Title", text: $title)
                TextField("Description", text: $description)
            }
            .navigationTitle("Add new activity")
            .toolbar {
                ToolbarItem(placement: ToolbarItemPlacement.navigationBarTrailing) {
                    Button("Save") {
                        let item = Activity(title: title, description: description)
                        self.activities.activities.append(item)

                    }
                }
            }
        }
    }

    init(activities: Activities, selected: Activity) {
        self.title = selected.title
        self.title = selected.description
    }
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditView(activities: Activities())
    }
}
