//
//  GridStackDemo.swift
//  ViewBuilderDemos
//
//  Created by Rudolf Farkas on 04.12.21.
//

// https://www.hackingwithswift.com/books/ios-swiftui/custom-containers

import SwiftUI

struct GridStackDemo: View {
    var body: some View {
        GridStackView(rows: 7, columns: 3) { row, col in
            HStack {
                Image(systemName: "\(row * 4 + col).circle")
                Text("R\(row) C\(col)")
            }
        }
    }
}

struct GridStackDemo_Previews: PreviewProvider {
    static var previews: some View {
        GridStackDemo()
.previewInterfaceOrientation(.portraitUpsideDown)
    }
}
