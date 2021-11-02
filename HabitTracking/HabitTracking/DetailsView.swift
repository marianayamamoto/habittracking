//
//  DetailsView.swift
//  HabitTracking
//
//  Created by Mariana Yamamoto on 10/25/21.
//

import SwiftUI

struct GrowingButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}

struct DetailsView: View {
    @EnvironmentObject var activities: Activities
    var index: Int

    var body: some View {
        VStack(spacing: 4) {
            Text(activities.activities[index].title)
                .font(.title)
                .textCase(.uppercase)
            Text(activities.activities[index].description)
                .font(.body)
                .fontWeight(.bold)
            Text("You've completed this activity \(activities.activities[index].count) times")
                .font(.body)
            Button(action: {
                self.activities.activities[self.index].count += 1
            }) {
                Text("Complete")
            }
            .padding()
            .buttonStyle(GrowingButton())
        }

    }

}

struct StatefulPreviewWrapper<Value, Content: View>: View {
    @State var value: Value
    var content: (Binding<Value>) -> Content

    var body: some View {
        content($value)
    }

    init(_ value: Value, content: @escaping (Binding<Value>) -> Content) {
        self._value = State(wrappedValue: value)
        self.content = content
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        let item = Activity(title: "test", description: "test test", count: 0)
        let list = Activities()
        list.activities = [item]
        return DetailsView(index: 0).environmentObject(list)
    }
}
