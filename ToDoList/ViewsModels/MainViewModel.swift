//
//  MainViewModel.swift
//  ToDoList
//
//  Created by Marcelo De Araújo on 07/05/23.
//

import FirebaseAuth
import Foundation

class MainViewModel: ObservableObject {

    @Published var currentUserld: String = ""
    private var handler: AuthStateDidChangeListenerHandle?

    init() {
        self.handler = Auth.auth().addStateDidChangeListener { [weak self] _, user in
            DispatchQueue.main.async {
                self?.currentUserld = user?.uid ?? ""
            }
        }
    }

    public var isSignedIn: Bool {
        return Auth.auth().currentUser != nil
    }
}
