//
//  TaskSectionHeader.swift
//  NightWatch
//
//  Created by Miguel Rueda on 14/09/21.
//

import SwiftUI

struct TaskSectionHeader: View {
    
    let symbolSystemName: String
    let headerText: String
    
    var body: some View {
        HStack {
            Image(systemName: symbolSystemName)
            Text(headerText)
        }.font(.title3)
        .foregroundColor(.accentColor)
    }
}

struct TaskSectionHeader_Previews: PreviewProvider {
    static var previews: some View {
        TaskSectionHeader(symbolSystemName: "calendar", headerText: "The title")
    }
}
