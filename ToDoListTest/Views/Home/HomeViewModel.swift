//
//  HomeViewModel.swift
//  ToDoListTest
//
//  Created by Marat Fakhrizhanov on 08.05.2025.
//

import Foundation

class HomeViewModel: Observable {
    
    @Published var notes: [Note] = DataBaseManager.shared.notes
    
    func fetchTasks() {
        
    }
    
}
