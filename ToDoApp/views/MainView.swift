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
    var body: some View {
        ScrollView {
            VStack {
                ForEach(todoList.indices, id: \.self) { index in
                    ToDoCardView(todo: todoList[index])
                        .background(index % 2 == 0 ? Color.cyan : Color.mint)
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
