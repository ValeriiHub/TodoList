//
//  ListViewModel.swift
//  TodoList
//
//  Created by User03 on 26.04.2023.
//

import Foundation

class ListViewModel: ObservableObject {
    @Published var items: [ItemModel] = []
    
    init() {
        getItems()
    }
    
    func getItems() {
        let newItems = [
            ItemModel(title: "First", isCompleated: false),
            ItemModel(title: "Second", isCompleated: true),
            ItemModel(title: "Third", isCompleated: false)
        ]
        items.append(contentsOf: newItems)
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String) {
        let newItem = ItemModel(title: title, isCompleated: false)
        items.append(newItem)
    }
}
