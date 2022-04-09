//
//  DetailView.swift
//  ToDoApp
//  
//  Created by kunikuni03 on 2022/04/02
//  
//

import SwiftUI

struct DetailView: View {
    @Binding var todo: ToDoModel
    var body: some View {
        List {
            Section("Title") {
                Text(todo.title)
            }
            Section("Detail") {
                Text(todo.detail)
                    .lineLimit(nil)
            }
            Section("Deadline") {
                Text(todo.deadline, style: .date)
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(todo: .constant(ToDoModel.sampleToDo[0]))
    }
}
