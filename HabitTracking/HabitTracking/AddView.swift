    //
    //  AddView.swift
    //  HabitTracking
    //
    //  Created by Mariana Yamamoto on 10/25/21.
    //

import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
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
                        let item = Activity(title: title, description: description, count: 0)
                        self.activities.activities.append(item)
                        self.presentationMode.wrappedValue.dismiss()

                    }
                }
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(activities: Activities())
    }
}
