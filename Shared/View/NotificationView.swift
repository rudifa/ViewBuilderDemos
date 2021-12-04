//
//  NotificationView.swift
//  ViewBuilderDemos
//
//  Created by Rudolf Farkas on 04.12.21.
//

// https://swiftwithmajid.com/2019/12/18/the-power-of-viewbuilder-in-swiftui/

/*
 - NotificationView.init takes a closure that returns a View
 - the closure is executed at the instantiation nad the result stored
 - the stored result is inserted into the body
 */

import SwiftUI

struct NotificationView<Content: View>: View {
    let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content() // executed here!
    }

    var body: some View {
        content
            .padding()
            .background(Color(.tertiarySystemBackground))
            .cornerRadius(16)
            .transition(.move(edge: .top))
            .animation(.spring())
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView(content: {Text("notification")})
    }
}
