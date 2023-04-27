//
//  TodoListApp.swift
//  TodoList
//
//  Created by User03 on 25.04.2023.
//

import SwiftUI

@main
struct TodoListApp: App {
    
    @StateObject var listVM = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .navigationViewStyle(.stack)
            .environmentObject(listVM)
        }
    }
}
