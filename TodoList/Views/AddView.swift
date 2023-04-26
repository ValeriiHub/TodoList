//
//  AddView.swift
//  TodoList
//
//  Created by User03 on 25.04.2023.
//

import SwiftUI

struct AddView: View {
    
    @EnvironmentObject var listVM: ListViewModel
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var textFieldText = ""
    @State private var alertTitle = ""
    @State private var isAlertShow = false
    
    var body: some View {
        ScrollView {
            TextField("Type something here...", text: $textFieldText)
                .padding(.horizontal)
                .frame(height: 55)
                .background(Color.gray.opacity(0.3))
                .cornerRadius(10)
            
            Button {
                saveButtonPressed()
            } label: {
                Text("Save".uppercased())
                    .foregroundColor(.white)
                    .font(.headline)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.accentColor)
                    .cornerRadius(10)
            }
            .alert(Text(alertTitle), isPresented: $isAlertShow) {
                Button("OK") { }
            }
        }
        .padding(14)
        .navigationTitle("Add an Item🖊️")
    }
    
    func saveButtonPressed() {
        if textIsAppropriate() {
            listVM.addItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func textIsAppropriate() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "Your new todo item must be at least 3 characters long!!! 😱"
            isAlertShow.toggle()
            return false
        }
        
        return true
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }
        .environmentObject(ListViewModel())
    }
}
