//
//  RegisterView.swift
//  ToDoList
//
//  Created by Marcelo De Araújo on 07/05/23.
//

import SwiftUI

struct RegisterView: View {

    @StateObject var viewModel = RegisterViewModel()

    var body: some View {
        VStack {
            // Header
            HeaderView(
                title: "Register",
                subtitle: "Start Orginizing tods",
                angle: -15,
                background: .orange
            )

            Form {
                TextField("Full Name", text: $viewModel.name)
                    .textFieldStyle (DefaultTextFieldStyle())
                    .autocorrectionDisabled()

                TextField("Email Address", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())

                TLButton(
                    title: "Create Account",
                    background: .green
                ) {
                    viewModel.register()
                }
                .padding()
            }
            .offset(y: -10)
            Spacer()
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
