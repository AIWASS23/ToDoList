//
//  LoginViewModel.swift
//  ToDoList
//
//  Created by Marcelo De Araújo on 07/05/23.
//

import Foundation
import FirebaseAuth


class LoginViewModel: ObservableObject {

    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""

    init() {}

    func login() {
        guard validate() else {
            return
        }
        // Try log in
        Auth.auth().signIn(withEmail: email, password: password)
    }

    private func validate() -> Bool {
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in:.whitespaces).isEmpty else {
            errorMessage = "Please fill in all fields."
            return false
        }

        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Please enter in validate email."
            return false

        }

        return true
    }
}
