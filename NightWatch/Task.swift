//
//  Task.swift
//  NightWatch
//
//  Created by Miguel Rueda on 20/09/21.
//

import Foundation

struct Task: Identifiable {
    let id = UUID()
    let name: String
    var isComplete: Bool
    var lastCompleted: Date?
}
