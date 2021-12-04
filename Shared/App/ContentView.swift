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
                NavigationLink(destination: { NotificationInUse() }, label: { Text("Notification In Use") })
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
