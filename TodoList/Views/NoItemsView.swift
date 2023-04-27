//
//  NoItemsView.swift
//  TodoList
//
//  Created by User03 on 27.04.2023.
//

import SwiftUI

struct NoItemsView: View {
    
    @State private var animate = false
    
    var body: some View {
        ScrollView {
            VStack {
                Text("There no items!")
                    .font(.title)
                    .fontWeight(.semibold)
                
                Text("Are you a productive person?")
                    .padding(.bottom, 20)
                
                NavigationLink {
                    AddView()
                } label: {
                    Text("Add Something 🥳")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(animate ? Color.red : .blue)
                        .cornerRadius(10)
                }
                .padding(.horizontal, animate ? 30 : 50)
                .scaleEffect(animate ? 1.1 : 1)
                .offset(y: animate ? -7 : 0)
                .shadow(color: animate ? Color.red.opacity(0.7) : .blue.opacity(0.7),
                        radius: animate ? 30 : 10,
                        x: 0,
                        y: animate ? 50 : 30)
            }
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimation)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func addAnimation() {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(.easeInOut(duration: 2).repeatForever()) {
                animate.toggle()
            }
        }
    }
}

struct NoItemsView_Previews: PreviewProvider {
    static var previews: some View {
        NoItemsView()
    }
}
