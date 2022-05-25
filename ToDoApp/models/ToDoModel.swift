//
//  ToDoModel.swift
//  ToDoApp
//  
//  Created by kunikuni03 on 2022/03/31
//  
//

import Foundation

struct ToDoModel: Identifiable, Codable {
    var id: UUID = UUID()
    var title: String
    var detail: String
    var deadline: Date

    init() {
        self.title = ""
        self.detail = ""
        self.deadline = Date()
    }

    init(title: String, detail: String, deadline: Date) {
        self.title = title
        self.detail = detail
        self.deadline = deadline
    }
}

extension ToDoModel {
    static var sampleToDo: [ToDoModel] {
        [
            ToDoModel(title: "Insert Title1", detail: "detail text", deadline: Date.now),
            ToDoModel(title: "Insert Title2", detail: "detail text", deadline: Date.now),
            ToDoModel(title: "Insert Title3", detail: "detail text", deadline: Date.now),
        ]
    }

    func Save() {
        let todo = try! JSONEncoder().encode(self)
        guard let dirPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            return
        }

        let filePath = dirPath.appendingPathComponent("todo.json")

        do {
            try todo.write(to: filePath)
        } catch {
            return
        }
    }
}
