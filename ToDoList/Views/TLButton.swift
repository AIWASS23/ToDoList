//
//  TLButton.swift
//  ToDoList
//
//  Created by Marcelo De Araújo on 07/05/23.
//

import SwiftUI

struct TLButton: View {

    let title: String
    let background: Color
    let action: () -> Void

    var body: some View {
        Button {
            action ()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor (background)
                Text(title)
                    .foregroundColor (Color.white)
                    .bold ()
            }
        }
        .contentShape(Rectangle())
        .padding()
    }
}

struct TLButton_Previews: PreviewProvider {
    static var previews: some View {
        TLButton (
            title: "Value",
            background: .pink) {
                // Action
            }
    }
}


