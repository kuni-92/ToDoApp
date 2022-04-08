//
//  MainView.swift
//  ToDoApp
//  
//  Created by kunikuni03 on 2022/03/31
//  
//

import SwiftUI

struct MainView: View {
    @State private var todoList: [ToDoModel] = ToDoModel.sampleToDo
    @State private var isPresented: Bool = false
    @State private var newToDo: ToDoModel = ToDoModel()
    var body: some View {
        NavigationView {
            ZStack {
                ToDoListView(todoList: $todoList)
                Button(action:{
                    isPresented = true
                }) {
                    AddButtonView()
                        .background(Color("ButtonColor"))
                        .clipShape(Circle())
                        .frame(width: 80, height: 80)
                        .shadow(radius: 10)
                }
                .padding(30)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
            }
            .sheet(isPresented:$isPresented, onDismiss: {
                if newToDo.title != "" {
                    todoList.append(newToDo)
                    newToDo = ToDoModel()
                }
            }) {
                AddToDoView(isPresented: $isPresented, newToDo: $newToDo)
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
