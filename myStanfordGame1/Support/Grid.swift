//
//  Grid.swift
//  Memorize_stanford_4
//
//  Created by ha tuong do on 5/14/21.
//

import SwiftUI

// struct Grid<Item, ItemView> : View  {
struct Grid<Item, ItemView> : View where Item: Identifiable, ItemView: View {
    private var items: [Item]   // is public only if you ask people to init it
                                // but since we do init() ourself inside this struct, it can be private
    private var viewForItem: (Item) -> ItemView // viewForItem() is a function defined in E..MemoryGameView.swift
    
    init(_ items: [Item], viewForItem: @escaping (Item) -> ItemView) {
        self.items = items
        self.viewForItem = viewForItem
    }
    
    var body: some View {
        GeometryReader { geometry  in
            body1(for:  GridLayout(itemCount: items.count, in: geometry.size))
            }
    }
    
    private func body1(for layout: GridLayout) -> some View {
        ForEach(items) { item in
            // body2(for: item, in: layout)
            viewForItem(item)
                .frame(width: layout.itemSize.width, height: layout.itemSize.height)
                .position(layout.location(ofItemAt: self.items.firstIndex(matching: item)!)) // was item, now item!
        }
    }
    
    func index(of item: Item) -> Int {
        for index in 0..<items.count {
            if items[index].id == item.id { return index}
        }
        return 0 // TODO: bogus
    }
    
}
