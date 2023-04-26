//
//  AddView.swift
//  TodoList
//
//  Created by User03 on 25.04.2023.
//

import SwiftUI

struct AddView: View {
    
    @State private var textFieldText = ""
    
    var body: some View {
        ScrollView {
            TextField("Type something here...", text: $textFieldText)
                .padding(.horizontal)
                .frame(height: 55)
                .background(Color.gray.opacity(0.3))
                .cornerRadius(10)
            
            Button {
                
            } label: {
                Text("Save".uppercased())
                    .foregroundColor(.white)
                    .font(.headline)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.accentColor)
                    .cornerRadius(10)
            }

        }
        .padding(14)
        .navigationTitle("Add an Item🖊️")
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }
    }
}
