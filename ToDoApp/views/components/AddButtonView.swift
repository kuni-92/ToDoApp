//
//  AddButtonView.swift
//  ToDoApp
//  
//  Created by kunikuni03 on 2022/04/07
//  
//

import SwiftUI

struct AddButtonView: View {
    var body: some View {
        Image(systemName: "plus")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding()
    }
}

struct AddButtonView_Previews: PreviewProvider {
    static var previews: some View {
        AddButtonView()
    }
}
