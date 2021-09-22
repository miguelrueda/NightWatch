//
//  DetailsView.swift
//  NightWatch
//
//  Created by Miguel Rueda on 14/09/21.
//

import SwiftUI

struct DetailsView: View {
    
    let task: Task
    
    var body: some View {
        VStack {
            Text(task.name)
        }
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(task: Task(name: "Test Task", isComplete: false, lastCompleted: nil))
    }
}
