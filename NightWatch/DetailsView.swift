//
//  DetailsView.swift
//  NightWatch
//
//  Created by Miguel Rueda on 14/09/21.
//

import SwiftUI

struct DetailsView: View {
    
    @Binding var task: Task
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    var body: some View {
        VStack {
            if (verticalSizeClass == .regular) {
                Image("test").resizable().aspectRatio(contentMode: .fit)
            }
            Text(task.name)
            
            if (verticalSizeClass == .regular) {
                Divider()
                Text("Placeholder for task description")
                Divider()
                
            }
            Button("Mark Complete") {
                task.isComplete = true
            }
        }
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DetailsView(task: Binding<Task>.constant(Task(name: "Test Task", isComplete: false, lastCompleted: nil)))
            DetailsView(task: Binding<Task>.constant(Task(name: "Test Task", isComplete: false, lastCompleted: nil)))
                .preferredColorScheme(.dark)
                .previewLayout(.device)
        }
    }
}
