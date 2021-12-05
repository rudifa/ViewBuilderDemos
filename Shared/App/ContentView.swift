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
                NavigationLink(destination: { NotificationDemo() }, label: { Text("Notification Demo")
                })
                NavigationLink(destination: { BottomSheetDemo() }, label: { Text("Bottom Sheet Demo")
                })
                NavigationLink(destination: { GridStackDemo() }, label: {
                    Text("Grid Stack Demo")
                })
                NavigationLink(destination: { GridWithIndicesDemo() }, label: {
                    Text("Grid With Indices Demo")
                })
                NavigationLink(destination: { ForEachWithIndexDemo() }, label: {
                    Text("ForEach With Index Demo")
                })
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
