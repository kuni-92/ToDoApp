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
    @State private var todoTitle: String = ""
    @State private var todoDetail: String = ""
    @State private var todoDeadline: Date = Date.now
    var body: some View {
        List {
            Section("Title") {
                TextField("What are you doing?", text: $todoTitle)
            }
            Section("Detail") {
                TextEditor(text: $todoDetail)
                    .frame(height: 200)
            }
            Section("Deadline") {
                DatePicker("When is the deadline?", selection: $todoDeadline, in: Date.now..., displayedComponents: .date)
            }
            Text("Submit")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .foregroundColor(.cyan)
                .listRowBackground(Color("ButtonColor"))
                .contentShape(Rectangle())
                .onTapGesture {
                    newToDo.title = todoTitle
                    newToDo.detail = todoDetail
                    newToDo.deadline = todoDeadline
                    todoTitle = ""
                    todoDetail = ""
                    todoDeadline = Date.now
                    isPresented = false
                }
        }
    }
}

struct AddToDoView_Previews: PreviewProvider {
    static var previews: some View {
        AddToDoView(isPresented: .constant(true), newToDo: .constant(ToDoModel()))
    }
}
