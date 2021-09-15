//
//  DetailsView.swift
//  NightWatch
//
//  Created by Miguel Rueda on 14/09/21.
//

import SwiftUI

struct DetailsView: View {
    
    let taskName: String
    
    var body: some View {
        VStack {
            Text(taskName)
            Text("placehoder1")
            Text("placehoder2")
        }
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(taskName: "Test Task")
    }
}
