//
//  NetworkManager.swift
//  ToDoListTest
//
//  Created by Marat Fakhrizhanov on 10.05.2025.
//

import Foundation
import SwiftUI

final class NetworkManager {
    
    private let link: String = "https://dummyjson.com/todos"
    private var notes: [ApiNote] = []
    private let db = DataBaseManager.shared
    private let lounchControl = LounchControl()
    
    init() { fetchNotes() }
    
    private func fetchNotes() {
        guard let url = URL(string: link) else { print("bad URL error"); return }
        
        URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard error == nil else { print("request error"); return }
            guard let data = data else { print("no data"); return }
            
            do {
                let response = try JSONDecoder().decode(ApiNotes.self, from: data)
                DispatchQueue.main.async {
                    let notes = response.todos
                    self.notes = notes
                    print("Api notes --- >>>",notes)
                    
                    // add apiNotes in CoreData
                    for note in self.notes {
                        self.db.createNote(title: "Заметка из сети", text: note.todo, status: note.completed)
                    }
                    self.lounchControl.firstDownload = false
                }
            } catch {
                print("decode error")
            }
        }.resume()
    }
    
}
