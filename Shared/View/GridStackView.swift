//
//  GridStackView.swift
//  ViewBuilderDemos
//
//  Created by Rudolf Farkas on 04.12.21.
//

// https://www.hackingwithswift.com/books/ios-swiftui/custom-containers

import SwiftUI

struct GridStackView<Content: View>: View {
    let rows: Int
    let columns: Int
    let content: (Int, Int) -> Content // closure stored here

    var body: some View {
        VStack {
            ForEach(0 ..< rows, id: \.self) { row in
                HStack {
                    ForEach(0 ..< columns, id: \.self) { column in
                        content(row, column)
                    }
                }
            }
        }
    }
}

// struct GridStackView_Previews: PreviewProvider {
//    static var previews: some View {
//        GridStackView()
//    }
// }
