//
//  ToDoCardView.swift
//  ToDoApp
//  
//  Created by kunikuni03 on 2022/03/31
//  
//

import SwiftUI

struct ToDoCardView: View {
    var todo: ToDoModel
    var body: some View {
        HStack {
            IconImage()
                .frame(width: 40, height: 40)
                .padding()
            Text(todo.title)
                .font(.title)
            Spacer()
        }
        .frame(width: 400, height: 80)
    }
}

struct ToDoCardView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoCardView(todo: ToDoModel.sampleToDo[0])
    }
}
