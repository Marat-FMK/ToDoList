//
//  StorageManager.swift
//  ToDoListTest
//
//  Created by Marat Fakhrizhanov on 13.05.2025.
//

import Foundation

class StorageManager {
    private let lounchControl = LounchControl()
    private let db = DataBaseManager.shared
    static let shared = StorageManager()
    
    private init() {}
    
    func saveApiNotesInCoreData(notes: [ApiNote]) {
        for note in notes {
            self.db.createNote(title: "Заметка из сети", text: note.todo, status: note.completed)
        }
        self.lounchControl.firstDownload = true
    }
}
