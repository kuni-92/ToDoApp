//
//  ToDoListView.swift
//  ToDoApp
//  
//  Created by kunihiro on 2022/04/08
//  
//

import SwiftUI

struct ToDoListView: View {
    @Binding var todoList: [ToDoModel]
    var body: some View {
        List {
            ForEach(todoList.indices, id: \.self) { index in
                NavigationLink(destination: DetailView()) {
                    ToDoCardView(todo: todoList[index])
                        .foregroundColor(.primary)
                        .background(index % 2 == 0 ? Color.cyan : Color.mint)
                        .cornerRadius(10)
                        .frame(width: 300, height: 80)
                }
            }
            .onMove(perform: {index, offset in
                todoList.move(fromOffsets: index, toOffset: offset)
            })
            .onDelete(perform: { ofset in
                todoList.remove(atOffsets: ofset)
            })
        }
        .navigationTitle("ToDo List")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                EditButton()
            }
        }
    }
}

struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView(todoList: .constant(ToDoModel.sampleToDo))
    }
}
