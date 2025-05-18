//
//  NetworkManager.swift
//  ToDoListTest
//
//  Created by Marat Fakhrizhanov on 10.05.2025.
//

import Foundation
import SwiftUI

class NetworkManager {
    
    private let url: String = "https://dummyjson.com/todos"
    
    init() { fetchNotes() }
    
    private func fetchNotes() {
        guard let url = URL(string: url) else { print("Error - bad url"); return }
        
        URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard error == nil else { print("Error - request"); return }
            guard let data = data else { print("Error - no data"); return }
            
            do {
                let response = try JSONDecoder().decode(ApiNotes.self, from: data)
                DispatchQueue.main.async {
                    let notes = response.todos
                    print("Api notes --- >>>",notes)
                    StorageManager.shared.saveApiNotesInCoreData(notes: notes)
                }
            } catch {
                print("Error -decode error")
            }
        }.resume()
    }
}
