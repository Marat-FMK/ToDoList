//
//  HomeViewModel.swift
//  ToDoListTest
//
//  Created by Marat Fakhrizhanov on 08.05.2025.
//

import Foundation
import SwiftUI
import CoreData

class HomeViewModel: ObservableObject {
    @Published var notesCount = 0
    @Published var searchText: String = ""
    @Published var searchedNotes:[ Note] = []
    let db = DataBaseManager.shared

    
    func searchNote() {
        
    }
    
    func updateNoteStatus(note: Note) {
        db.updateNoteStatus(note: note)
    }
    
    func startRecodr() {}
}
