//
//  HomeViewModel.swift
//  ToDoListTest
//
//  Created by Marat Fakhrizhanov on 08.05.2025.
//

import SwiftUI
import CoreData

class HomeViewModel: ObservableObject {
    @Environment(\.managedObjectContext) private var context
    @Published var notesCount = 0
    @Published var searchText: String = ""
    @Published var searchedNotes: [Note] = []
    @Published var selectedNote: Note?
    @Published var blurValue = 0
    let db = DataBaseManager.shared
    
    
    func clearSearchText() {
        searchText = ""
        searchedNotes = []
    }
    
    func selectNote(note: Note) {
        selectedNote = note
        blurValue = 20
    }
    
    func clearSelectNote() {
        selectedNote = nil
        blurValue = 0
        print("clear selectNote")
    }
    
    func startRecodr() {}
    
    //MARK: - CoreData Methods
    func searchNote() {
        self.searchedNotes = db.searchNote(text: searchText)
    }
    
    func updateNoteStatus(note: Note) {
        db.updateNoteStatus(note: note)
        UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
    }
    
    func deleteNote(note: Note) {
        withAnimation {
            clearSelectNote()
            db.deleteNote(note: note)
        }
    }
 
}
