//
//  ItemModel.swift
//  TodoList
//
//  Created by User03 on 26.04.2023.
//

import Foundation

struct ItemModel: Identifiable {
    let id: String
    let title: String
    let isCompleated: Bool
    
    init(id: String = UUID().uuidString, title: String, isCompleated: Bool) {
        self.id = id
        self.title = title
        self.isCompleated = isCompleated
    }
    
    func updateCompletion() -> ItemModel {
        return ItemModel(id: id, title: title, isCompleated: !isCompleated)
    }
}
