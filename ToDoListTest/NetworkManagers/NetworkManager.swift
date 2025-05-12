//
//  NetworkManager.swift
//  ToDoListTest
//
//  Created by Marat Fakhrizhanov on 10.05.2025.
//

import Foundation
import SwiftUI

class NetworkManager {
    
    let link: String = "https://dummyjson.com/todos"
    var apiNotes: [ApiNote] = []
    
    init() { fetchNotes() }
    
    func fetchNotes() {
        guard let url = URL(string: link) else { print("bad URL error"); return }
        
        URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard error == nil else { print("request error"); return }
            guard let data = data else { print("no data"); return }
            
            do {
                let notes = try JSONDecoder().decode(ApiNotes.self, from: data)
                DispatchQueue.main.async {
                    print("Api notes --- >>>",notes.todos)
                    self.apiNotes = notes.todos
                }
            } catch {
                print("decode error")
            }
        }.resume()
    }
    
}
