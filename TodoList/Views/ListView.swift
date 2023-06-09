//
//  ContentView.swift
//  TodoList
//
//  Created by User03 on 25.04.2023.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listVM: ListViewModel
    
    var body: some View {
        ZStack {
            if listVM.items.isEmpty {
                NoItemsView()
                    .transition(.opacity.animation(.easeIn))
            } else {
                List {
                    ForEach(listVM.items) { item in
                        ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear) {
                                    listVM.updateItem(item: item)
                                }
                            }
                    }
                    .onDelete(perform: listVM.deleteItem)
                    .onMove(perform: listVM.moveItem)
                }
                .listStyle(.plain)
            }
        }
        .navigationTitle("Todo List📝")
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                EditButton()
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink {
                    AddView()
                } label: {
                    Text("Add")
                }
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
        .environmentObject(ListViewModel())
    }
}


