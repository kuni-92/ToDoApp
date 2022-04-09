//
//  AddButtonView.swift
//  ToDoApp
//  
//  Created by kunikuni03 on 2022/04/07
//  
//

import SwiftUI

struct AddButtonView: View {
    var action: () -> Void
    var body: some View {
        Button(action: action) {
            Image(systemName: "plus")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
                .background(Color("ButtonColor"))
                    .clipShape(Circle())
                    .frame(width: 80, height: 80)
                    .shadow(radius: 10)
            }
            .padding(30)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
    }
}

struct AddButtonView_Previews: PreviewProvider {
    static var previews: some View {
    AddButtonView(action: {})
    }
}
