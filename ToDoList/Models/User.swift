//
//  User.swift
//  ToDoList
//
//  Created by Marcelo De Araújo on 07/05/23.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
