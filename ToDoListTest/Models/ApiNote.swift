//
//  ApiNote.swift
//  ToDoListTest
//
//  Created by Marat Fakhrizhanov on 10.05.2025.
//

import Foundation

struct ApiNotes: Codable {
    let todos: [ApiNote]
}
struct ApiNote: Identifiable, Codable {
    let id: Int
    let todo: String
    let completed: Bool
    let userId: Int
}
