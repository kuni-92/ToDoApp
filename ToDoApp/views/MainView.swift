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
        NavigationView {
            ScrollView {
                VStack {
                    ForEach(todoList.indices, id: \.self) { index in
                        NavigationLink(destination: DetailView()) {
                            ToDoCardView(todo: todoList[index])
                                .foregroundColor(.primary)
                                .background(index % 2 == 0 ? Color.cyan : Color.mint)
                                .cornerRadius(10)
                        }
                    }
                }
                .navigationTitle("ToDo list")
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
