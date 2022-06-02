//
//  MainView.swift
//  ToDoApp
//  
//  Created by kunikuni03 on 2022/03/31
//  
//

import SwiftUI
import CoreData

struct MainView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \ToDo.deadline, ascending: true)],
        animation: .default
    ) private var managedToDo: FetchedResults<ToDo>
    @State private var todoList = [ToDoModel]()
    @State private var isPresented: Bool = false
    @State private var newToDo: ToDoModel = ToDoModel()
    var body: some View {
        NavigationView {
            ZStack {
                Group {
                    if todoList.count == 0 {
                        Text("What do you do?")
                            .font(.title)
                    } else {
                        ToDoListView(todoList: $todoList)
                    }
                }
                AddButtonView(action: {
                    isPresented = true
                })
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
        .onAppear {
            for savedToDo in managedToDo {
                let todo = ToDoModel(
                    id: savedToDo.id!,
                    title: savedToDo.title!,
                    detail: savedToDo.detail!,
                    deadline: savedToDo.deadline!
                )
                todoList.append(todo)
            }


        }
        .onChange(of: todoList) { newList in
            saveToDo(newList: newList)
        }
    }

    private func saveToDo(newList: [ToDoModel]) {
        do {
            let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "ToDo")
            let fetchResults = try viewContext.fetch(fetchRequest)
            for savedToDo in fetchResults {
                viewContext.delete(savedToDo)
            }

            for setToDo in newList {
                let newToDo = ToDo(context: viewContext)
                newToDo.id = setToDo.id
                newToDo.title = setToDo.title
                newToDo.detail = setToDo.detail
                newToDo.deadline = setToDo.deadline

                try viewContext.save()
            }

        } catch let error as NSError {
            print("ToDo save error : \(error)")
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
