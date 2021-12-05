//
//  GridStackView.swift
//  ViewBuilderDemos
//
//  Created by Rudolf Farkas on 04.12.21.
//

// https://www.hackingwithswift.com/books/ios-swiftui/custom-containers

import SwiftUI

// model
struct Item: Identifiable, Hashable {
    let id: Int
    var value: Int {
        id
    }
}

// viewModel

func items(n: Int) -> [Item] {
    return [Int](0 ..< n).map { Item(id: $0) }
}

// view

struct ItemView: View {
    let item: Item

    var body: some View {
        HStack(alignment: .center) {
            Image(systemName: "\(item.value).circle")
            Text("\(1000 * item.value)")
        }
    }
}

/// Demonstrate positioning of ItemView instance in a grid
struct GridWithIndices<Item, ItemView>: View where ItemView: View, Item: Identifiable, Item: Hashable {
    var items: [Item]
    let content: (Item) -> ItemView // closure stored here
    let numColumns = 3
    var numRows: Int {1 + items.count / numColumns}

    var body: some View {
        GeometryReader { geometry in
            let itemWidth = geometry.size.width / CGFloat(numColumns)
            let itemHeight = geometry.size.height / CGFloat(numRows)
            ZStack {
                ForEachWithIndex(data: items) { index, item in
                    let row = CGFloat(index / numColumns)
                    let col = CGFloat(index % numColumns)
                    content(item)
                        .position(x: (col + 0.5) * itemWidth, y: (row + 0.5) * itemHeight)
                }
            }
        }
    }
}

struct GridWithIndicesDemo: View {
    var body: some View {
        GridWithIndices(items: items(n: 50)) { item in
            ItemView(item: item)
        }
    }
}

struct GridStackView_Previews: PreviewProvider {
    static var previews: some View {
        GridWithIndicesDemo()
    }
}
