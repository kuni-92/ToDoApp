//
//  ToDoAppApp.swift
//  ToDoApp
//  
//  Created by kunikuni03 on 2022/03/31
//  
//

import SwiftUI

@main
struct ToDoAppApp: App {
    let persistenceController = PersistenceController.shared
    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
