//
//  DataBaseManager.swift
//  ToDoListTest
//
//  Created by Marat Fakhrizhanov on 08.05.2025.
//

import Foundation
import CoreData

final class DataBaseManager {
    
    static let shared = DataBaseManager()
   
    private init() { } //  func fetchNotes in init
    var notes: [Note] = []
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer (name: "Note")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    func saveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save ()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(error), \(nserror.userInfo)")
            }
        }
    }
}

//MARK: - CRUD
extension DataBaseManager {
    
    func createNote(title: String, text: String) {
        let note = Note(context: persistentContainer.viewContext)
        note.title = title
        note.text = text
        note.date = Date.now
        note.completed = false
        saveContext()
    }
    
    func fetchNotes() {
        let request = Note.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "date", ascending: true)]
        do {
            let notes = try persistentContainer.viewContext.fetch(request)
            self.notes = notes
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func updateNote(note: Note, newTitle: String = "", newText: String = "") {
        note.title = newTitle
        note.text = newText
        saveContext()
    }
    
    func deleteNote(note: Note) {
        let context = persistentContainer.viewContext
        context.delete(note)
        saveContext()
    }
}

                                       

    
    
