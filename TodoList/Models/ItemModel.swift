//
//  ItemModel.swift
//  TodoList
//
//  Created by User03 on 26.04.2023.
//

import Foundation

struct ItemModel: Identifiable {
    let id = UUID().uuidString
    let title: String
    let isCompleated: Bool
}
