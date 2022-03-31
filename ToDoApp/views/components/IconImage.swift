//
//  IconImage.swift
//  ToDoApp
//  
//  Created by kunikuni03 on 2022/03/31
//  
//

import SwiftUI

struct IconImage: View {
    var body: some View {
        Image(systemName: "checkmark.seal.fill")
            .renderingMode(.original)
            .resizable()
            .frame(width: 60, height: 60)
    }
}

struct IconImage_Previews: PreviewProvider {
    static var previews: some View {
        IconImage()
    }
}
