//
//  ToDoModel.swift
//  ToDoApp
//  
//  Created by kunikuni03 on 2022/03/31
//  
//

import Foundation

struct ToDoModel: Identifiable {
    var id: UUID = UUID()
    var title: String
}

extension ToDoModel {
    static var sampleToDo: [ToDoModel] {
        [
            ToDoModel(title: "Insert Title1"),
            ToDoModel(title: "Insert Title2"),
            ToDoModel(title: "Insert Title3"),
            ToDoModel(title: "Insert Title4"),
            ToDoModel(title: "Insert Title5"),
            ToDoModel(title: "Insert Title6"),
            ToDoModel(title: "Insert Title7"),
            ToDoModel(title: "Insert Title8"),
            ToDoModel(title: "Insert Title9"),
            ToDoModel(title: "Insert Title10"),
        ]
    }
}
