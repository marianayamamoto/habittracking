    //
    //  ContentView.swift
    //  HabitTracking
    //
    //  Created by Mariana Yamamoto on 10/25/21.
    //

import SwiftUI

struct ContentView: View {
    @ObservedObject var activities: Activities = Activities()
    @State private var showingAddActivity = false

    var body: some View {
        NavigationView {
            List {
                ForEach(activities.activities.indices, id: \.self) { index in
                    NavigationLink(destination: DetailsView(index: index).environmentObject(self.activities)) {
                        Text("(\(activities.activities[index].count)x) \(activities.activities[index].title)")
                    }
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("Habit Tracking")
            .sheet(isPresented: $showingAddActivity) {
                AddView(activities: self.activities)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        self.showingAddActivity = true
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }

    func removeItems(at offsets: IndexSet) {
        activities.activities.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
