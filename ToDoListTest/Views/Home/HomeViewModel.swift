//
//  HomeViewModel.swift
//  ToDoListTest
//
//  Created by Marat Fakhrizhanov on 08.05.2025.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    @Published var notes: [Note] = []
    @Published var notesCount = 0
    @Published var searchText: String = ""
    @Published var searchedNotes:[ Note] = []
    let db = DataBaseManager.shared
    
    init() { fetchNotes() }
    
    func fetchNotes() {
        notes = db.notes
    }
    
    func searchNote() {
        
    }
    
    func updateNoteStatus() {
        
    }
    
    
    
    func startRecodr() {}
}
