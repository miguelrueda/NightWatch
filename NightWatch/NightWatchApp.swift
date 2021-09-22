//
//  NightWatchApp.swift
//  NightWatch
//
//  Created by Miguel Rueda on 06/09/21.
//

import SwiftUI

@main
struct NightWatchApp: App {
    
    @StateObject private var nightWatchTasks = NightWatchTasks()
    
    var body: some Scene {
        WindowGroup {
            ContentView(nightWatchTasks: nightWatchTasks)
        }
    }
}
