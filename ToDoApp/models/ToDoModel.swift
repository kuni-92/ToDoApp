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
        ]
    }
}
