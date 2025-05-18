//
//  DetailViewModel.swift
//  ToDoListTest
//
//  Created by Marat Fakhrizhanov on 09.05.2025.
//

import SwiftUI

class DetailViewModel: ObservableObject {
    @Published var title: String = ""
    @Published var text: String = ""
    let db = DataBaseManager.shared
    let note: Note?
    
    init(note: Note?) {
        self.note = note
        setNoteValues()
    }
    
    func updateNote() {
        guard let note = note else { return }
        db.updateNote(note: note, newTitle: title, newText: text)
    }
    
    func createNote() {
        db.createNote(title: title, text: text)
    }
    
    func setNoteValues() {
        guard let note = note else { return }
        self.title = note.title
        self.text = note.text
    }
    
    func checkEmpty() -> Bool {
        !title.isEmpty || !text.isEmpty ? true : false
    }
}
