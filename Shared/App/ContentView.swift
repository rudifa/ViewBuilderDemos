//
//  ContentView.swift
//  Shared
//
//  Created by Rudolf Farkas on 04.12.21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: { NotificationDemo() }, label: { Text("Notification Demo") })
                NavigationLink(destination: { BottomSheetDemo() }, label: { Text("Bottom Sheet Demo") })
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
