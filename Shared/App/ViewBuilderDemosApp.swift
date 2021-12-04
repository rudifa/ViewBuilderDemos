//
//  ViewBuilderDemosApp.swift
//  Shared
//
//  Created by Rudolf Farkas on 04.12.21.
//

import SwiftUI

#if os(macOS)
    let windowSize = CGSize(width: 450, height: 800)
#endif

@main
struct ViewBuilderDemosApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
            #if os(macOS)
                .frame(minWidth: windowSize.width,
                       maxWidth: windowSize.width,
                       minHeight: windowSize.height,
                       maxHeight: windowSize.height)
            #endif
        }
    }
}
