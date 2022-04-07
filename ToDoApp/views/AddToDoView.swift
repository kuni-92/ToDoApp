//
//  AddToDoView.swift
//  ToDoApp
//  
//  Created by kunikuni03 on 2022/04/07
//  
//

import SwiftUI

struct AddToDoView: View {
    @Binding var isPresented: Bool
    @Binding var newToDo: ToDoModel
    @FocusState private var isFocused: Bool
    @State private var todoTitle: String = ""
    var body: some View {
        VStack {
            TextField("New ToDo", text: $todoTitle)
                .font(.title)
                .padding()
                .background(Color.mint)
                .focused($isFocused)
                .onSubmit {
                    newToDo.title = todoTitle
                    todoTitle = ""
                    isFocused = false
                    isPresented = false
                }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.cyan)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline:  .now() + 0.5) {
                isFocused = true
            }
        }
    }
}

struct AddToDoView_Previews: PreviewProvider {
    static var previews: some View {
        AddToDoView(isPresented: .constant(true), newToDo: .constant(ToDoModel()))
    }
}
