//
//  BottomSheetDemo.swift
//  ViewBuilderDemos
//
//  Created by Rudolf Farkas on 04.12.21.
//

// https://swiftwithmajid.com/2019/12/11/building-bottom-sheet-in-swiftui/

import SwiftUI

struct BottomSheetDemo: View {
    @State private var bottomSheetShown = false

    var body: some View {
        GeometryReader { geometry in
            Color.green
            BottomSheetView(
                isOpen: self.$bottomSheetShown,
                maxHeight: geometry.size.height * 0.7
            ) {
                ZStack {
                    Color.blue
                    Text("Bottom Sheet")
                }
            }
        }.edgesIgnoringSafeArea(.all)
    }
}

struct BottomSheetDemo_Previews: PreviewProvider {
    static var previews: some View {
        BottomSheetDemo()
    }
}
