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
    
    var context: NSManagedObjectContext {
                   container.viewContext
               }
   
    let container: NSPersistentContainer
        
    var notes: [Note] = []

           private init() {
               container = NSPersistentContainer(name: "Note")
               container.loadPersistentStores { description, error in
                   if let error = error {
                       fatalError("Ошибка загрузки: \(error.localizedDescription)")
                   }
               }
               
               container.viewContext.automaticallyMergesChangesFromParent = true
           }

           
    
    
    
    
//    lazy var persistentContainer: NSPersistentContainer = {
//        let container = NSPersistentContainer (name: "Note")
//        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
//            if let error = error as NSError? {
//                fatalError("Unresolved error \(error), \(error.userInfo)")
//            }
//        })
//        return container
//    }()
    
    func saveContext() {
        let context = context
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
        let note = Note(context: context)
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
            let notes = try context.fetch(request)
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
    
    func updateNoteStatus(note: Note) {
            let id = note.objectID
            container.performBackgroundTask { ctx in
                do {
                    let noteInBackground = try ctx.existingObject(with: id) as? Note
                    noteInBackground?.completed.toggle()
                    try ctx.save()
                    DispatchQueue.main.async {
                                   let mainNote = try? self.context.existingObject(with: id) as? Note
                                   mainNote.map { self.context.refresh($0, mergeChanges: true) }
                               }
                } catch {
                    print("Ошибка обновления: \(error)")
                }
            }
        }
    
//    func updateNoteStatus(note: Note) {
//        note.completed.toggle()
//        saveContext()
//    }
    
    func deleteNote(note: Note) {
        let context = context
        context.delete(note)
        saveContext()
    }
}

                                       

    
    
