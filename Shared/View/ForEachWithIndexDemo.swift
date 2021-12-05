//
//  ForEachWithIndexDemo.swift
//  ViewBuilderDemos
//
//  Created by Rudolf Farkas on 05.12.21.
//

import SwiftUI

// viewModel

let viewModelBooks: [Book] = [
    Book(name: "First"),
    Book(name: "Second"),
    Book(name: "Third"),
    Book(name: "Last"),
]

struct BookView: View {
    let book: Book
    var body: some View {
        VStack {
            Text("\(book.name)")
            Text("\(book.id)").font(.caption)
        }
    }
}

struct ForEachWithIndexDemo: View {
    var body: some View {
        VStack {
            ForEachWithIndex(data: viewModelBooks) { index, book in
                BookView(book: book)
                    .background(index % 2 == 0 ? Color.green : Color.orange)
                if index < viewModelBooks.count - 1 {
                    Divider()
                }
            }
        }
    }
}

struct ForEachWithIndicesDemo_Previews: PreviewProvider {
    static var previews: some View {
        ForEachWithIndexDemo()
    }
}
