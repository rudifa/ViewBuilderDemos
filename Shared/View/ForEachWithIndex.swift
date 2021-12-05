//
//  ForEachWithIndex.swift
//  ViewBuilderDemos
//
//  Created by Rudolf Farkas on 04.12.21.
//

// How to use ForEach with indices in SwiftUI
// https://onmyway133.com/posts/how-to-use-foreach-with-indices-in-swiftui/

import SwiftUI

// A ForEach variant providing both element and element index to the Content view
struct ForEachWithIndex<Data: RandomAccessCollection, Content: View>: View where Data.Element: Identifiable, Data.Element: Hashable {
    let data: Data
    @ViewBuilder let content: (Data.Index, Data.Element) -> Content

    var body: some View {
        ForEach(Array(zip(data.indices, data)), id: \.1) { index, element in
            content(index, element)
        }
    }
}

/// A ForEach variant providing both element and element index to the Content view
/// - Returns: some View
func forEachWithIndex<Data: RandomAccessCollection, Content: View>(
    _ data: Data,
    @ViewBuilder content: @escaping (Data.Index, Data.Element) -> Content
) -> some View where Data.Element: Identifiable, Data.Element: Hashable {
    // key operation: zip together indices and data items
    ForEach(Array(zip(data.indices, data)), id: \.1) { index, element in
        content(index, element)
    }
}

// MARK: demo

// model

struct Book: Hashable, Identifiable {
    let id = UUID()
    let name: String
}

// viewModel

let viewModelBooks2: [Book] = [
    Book(name: "AAA"),
    Book(name: "BBB"),
    Book(name: "CCC"),
    Book(name: "ZZZ"),
]

// view

struct BooksView: View {
    let books: [Book]
    var body: some View {
        List {
            // using directly the key operation: zip together indices and data items
            ForEach(Array(zip(books.indices, books)), id: \.1) { index, book in
                Text(book.name)
                    .background(index % 2 == 0 ? Color.green : Color.orange)
            }
        }
    }
}

struct BookView2: View {
    let index: Int
    let book: Book
    var body: some View {
        HStack {
            Image(systemName: "\(index).circle")
            Text("\(book.name)")
        }
    }
}

struct ForEachWithIndex_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            BooksView(books: viewModelBooks2)
            VStack {
                // using the encapsulated key operation
                ForEachWithIndex(data: viewModelBooks2) { index, book in
                    BookView2(index: index, book: book)
                        .background((index % 2 == 0 ? Color.blue : Color.red)
                            .opacity(0.5))
                        .padding()
                    if index < viewModelBooks2.count - 1 {
                        Divider()
                    }
                }
            }
        }
    }
}
