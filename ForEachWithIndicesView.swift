//
//  ForEachWithIndicesView.swift
//  ViewBuilderDemos
//
//  Created by Rudolf Farkas on 04.12.21.
//

// How to use ForEach with indices in SwiftUI
// https://onmyway133.com/posts/how-to-use-foreach-with-indices-in-swiftui/

import SwiftUI

struct Book: Hashable, Identifiable {
    let id = UUID()
    let name: String
}

struct BooksView_0: View {
    let books: [Book]

    var body: some View {
        List {
            ForEach(Array(books.enumerated()), id: \.element) { index, book in
                Text(book.name)
                    .background(index % 2 == 0 ? Color.green : Color.orange)
            }
        }
    }
}

struct BooksView: View {
    let books: [Book]

    var body: some View {
        List {
            ForEach(Array(zip(books.indices, books)), id: \.1) { index, book in
                Text(book.name)
                    .background(index % 2 == 0 ? Color.green : Color.orange)
            }
        }
    }
}

func forEachWithIndex<
    Data: RandomAccessCollection,
    Content: View
>(
    _ data: Data,
    @ViewBuilder content: @escaping (Data.Index, Data.Element) -> Content
) -> some View where Data.Element: Identifiable, Data.Element: Hashable {
    ForEach(Array(zip(data.indices, data)), id: \.1) { index, element in
        content(index, element)
    }
}

struct ForEachWithIndex<
    Data: RandomAccessCollection,
    Content: View
>: View where Data.Element: Identifiable, Data.Element: Hashable {
    let data: Data
    @ViewBuilder let content: (Data.Index, Data.Element) -> Content

    var body: some View {
        ForEach(Array(zip(data.indices, data)), id: \.1) { index, element in
            content(index, element)
        }
    }
}

let viewModelBooks: [Book] = [
    Book(name: "First"),
    Book(name: "Second"),
    Book(name: "Third"),
    Book(name: "Last"),
]

struct BookRow: View {
    let book: Book
    var body: some View {
        VStack {
            Text("\(book.name)")
            Text("\(book.id)").font(.caption)
        }
    }
}

struct ForEachWithIndicesView: View {
    var body: some View {
        VStack {
            ForEachWithIndex(data: viewModelBooks) { index, book in
                BookRow(book: book)
                    .background(index % 2 == 0 ? Color.green : Color.orange)
                if index < viewModelBooks.count - 1 {
                    Divider()
                }
            }
        }
    }
}

struct ForEachWithIndicesView_Previews: PreviewProvider {
    static var previews: some View {
        ForEachWithIndicesView()
    }
}
