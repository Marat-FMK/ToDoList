//
//  HomeViewModel.swift
//  ToDoListTest
//
//  Created by Marat Fakhrizhanov on 08.05.2025.
//

import Foundation

class HomeViewModel: Observable {
    // @ in CoreData
    @Published var notes: [Note] = []
    
    func fetchNotes() {
        
    }
    
}
