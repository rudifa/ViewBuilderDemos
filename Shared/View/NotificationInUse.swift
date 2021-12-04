//
//  NotificationInUse.swift
//  ViewBuilderDemos
//
//  Created by Rudolf Farkas on 04.12.21.
//

// https://swiftwithmajid.com/2019/12/18/the-power-of-viewbuilder-in-swiftui/
import SwiftUI

struct NotificationInUse: View {
    @State private var notificationShown = false

    var body: some View {
        VStack {
            if self.notificationShown {
                NotificationView {
                    Text("notification")
                }
            }
            Spacer()

            Button("toggle") {
                self.notificationShown.toggle()
            }
            Spacer()
        }
    }
}

struct NotificationInUse_Previews: PreviewProvider {
    static var previews: some View {
        NotificationInUse()
    }
}
