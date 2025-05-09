//
//  HomeViewModel.swift
//  ToDoListTest
//
//  Created by Marat Fakhrizhanov on 08.05.2025.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    @Published var notes: [Note] = []  // @ in CoreData or init
    @Published var searchText: String = ""
    @Published var notesCount = 0
    
    let db = DataBaseManager.shared
    
    
    
    
    
    func searchNote() {
        
    }
    
    func updateNoteCompleted() {
        
    }
    
    
    
    func startRecodr() {}
}
