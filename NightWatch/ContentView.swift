//
//  ContentView.swift
//  NightWatch
//
//  Created by Miguel Rueda on 06/09/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var nightWatchTasks: NightWatchTasks
    @State private var focusModeOn = false
    
    var body: some View {
        NavigationView {
            List {
                Section (header: TaskSectionHeader(symbolSystemName: "moon.stars", headerText: "Nightly Tasks")){
                    
                    let taskIndices = nightWatchTasks.nightlyTasks.indices
                    let tasks = nightWatchTasks.nightlyTasks
                    let taskIndexPairs = Array(zip(tasks, taskIndices))
                    
                    ForEach(taskIndexPairs, id:\.0.id, content: {
                        task, taskIndex in
                        let nightWatchTasksWrapper = $nightWatchTasks
                        let tasksBinding = nightWatchTasksWrapper.nightlyTasks
                        
                        let theTaskBinding = tasksBinding[taskIndex]
                        
                        if focusModeOn == false || (focusModeOn && task.isComplete == false) {
                            NavigationLink(
                                destination: DetailsView(task: theTaskBinding),
                                label: {
                                    TaskRow(task: task)
                            })
                        }
                    }).onDelete(perform: { indexSet in
                        nightWatchTasks.nightlyTasks
                            .remove(atOffsets: indexSet)
                    }).onMove(perform:  { indices, newOffset in
                        nightWatchTasks.nightlyTasks
                            .move(fromOffsets: indices, toOffset: newOffset)
                    })
                }
                
                Section(header: TaskSectionHeader(symbolSystemName: "sunset", headerText: "Weekly Tasks")) {
                    
                    let taskIndices = nightWatchTasks.weeklyTasks.indices
                    let tasks = nightWatchTasks.weeklyTasks
                    let taskIndexPairs = Array(zip(tasks, taskIndices))
                    
                    ForEach(taskIndexPairs, id:\.0.id, content: {
                        task, taskIndex in
                        
                        let nightWatchTasksWrapper = $nightWatchTasks
                        let tasksBinding = nightWatchTasksWrapper.weeklyTasks
                        
                        let theTaskBinding = tasksBinding[taskIndex]
                        
                        if focusModeOn == false || (focusModeOn && task.isComplete == false) {
                            NavigationLink(
                                destination: DetailsView(task: theTaskBinding),
                                label: {
                                    TaskRow(task: task)
                            })
                        }
                    }).onDelete(perform: { indexSet in
                        nightWatchTasks.weeklyTasks
                            .remove(atOffsets: indexSet)
                    }).onMove(perform:  { indices, newOffset in
                        nightWatchTasks.weeklyTasks
                            .move(fromOffsets: indices, toOffset: newOffset)
                    })
                }
                
                Section (header: TaskSectionHeader(symbolSystemName: "calendar", headerText: "Monthly Tasks")){
                    
                    let taskIndices = nightWatchTasks.monthlyTasks.indices
                    let tasks = nightWatchTasks.monthlyTasks
                    let taskIndexPairs = Array(zip(tasks, taskIndices))
                    
                    ForEach(taskIndexPairs, id:\.0.id, content: {
                        task, taskIndex in
                        
                        let nightWatchTasksWrapper = $nightWatchTasks
                        let tasksBinding = nightWatchTasksWrapper.monthlyTasks
                        
                        let theTaskBinding = tasksBinding[taskIndex]
                        
                        if focusModeOn == false || (focusModeOn && task.isComplete == false) {
                            NavigationLink(
                                destination: DetailsView(task: theTaskBinding),
                                label: {
                                    TaskRow(task: task)
                            })
                        }
                    }).onDelete(perform: { indexSet in
                        nightWatchTasks.monthlyTasks
                            .remove(atOffsets: indexSet)
                    }).onMove(perform:  { indices, newOffset in
                        nightWatchTasks.monthlyTasks
                            .move(fromOffsets: indices, toOffset: newOffset)
                    })
                }
            }.listStyle(GroupedListStyle())
            .navigationTitle("Home")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Reset") {
                        let refreshedNightWatchTasks = NightWatchTasks()
                        self.nightWatchTasks.nightlyTasks = refreshedNightWatchTasks.nightlyTasks
                        self.nightWatchTasks.weeklyTasks = refreshedNightWatchTasks.weeklyTasks
                        self.nightWatchTasks.monthlyTasks = refreshedNightWatchTasks.monthlyTasks
                    }
                }
                ToolbarItem(placement: .bottomBar) {
                    Toggle(isOn: $focusModeOn, label: {
                        Text("Focus Mode")
                    })
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let nightWatchTasks = NightWatchTasks()
        Group {
            ContentView(nightWatchTasks: nightWatchTasks)
            TaskRow(task: Task(name: "Test task", isComplete: true, lastCompleted: nil))
                .previewLayout(.fixed(width: 300, height: 70))
        }
    }
}

struct TaskRow: View {
    
    let task: Task
    
    var body: some View {
        VStack {
            if task.isComplete {
                HStack {
                    Image(systemName: "checkmark.square")
                    Text(task.name)
                        .foregroundColor(.gray)
                        .strikethrough()
                }
            } else {
                HStack {
                    Image(systemName: "square")
                    Text(task.name)
                }
            }
        }
    }
}
