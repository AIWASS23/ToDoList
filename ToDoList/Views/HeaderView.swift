//
//  HeaderView.swift
//  ToDoList
//
//  Created by Marcelo De Araújo on 07/05/23.
//

import SwiftUI

struct HeaderView: View {

    let title: String
    let subtitle: String
    let angle: Double
    let background: Color

    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(background)
                .rotationEffect(Angle(degrees: angle))

            VStack {
                Text(title)
                    .font(.system(size: 50))
                    .foregroundColor(Color.white)
                    .bold()
                Text(subtitle)
                    .font(.system(size: 30))
                    .foregroundColor(Color.white)
            }
            .padding(.top)
        }
        .frame (width: UIScreen.main.bounds.width * 3, height: 400)
        .offset(y: -130)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(
            title: "Title",
            subtitle: "Subtitle",
            angle: 15,
            background: .pink
        )
    }
}
