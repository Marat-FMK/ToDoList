//
//  ToDoListTestApp.swift
//  ToDoListTest
//
//  Created by Marat Fakhrizhanov on 08.05.2025.
//

import SwiftUI

@main
struct ToDoListTestApp: App {
    let lounchControl = LounchControl()
    let db = DataBaseManager.shared
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environment(\.managedObjectContext, db.context)
                .onAppear {
                    if !lounchControl.firstDownload {
                        let _ = NetworkManager()
                    }
                }
        }
    }
}
