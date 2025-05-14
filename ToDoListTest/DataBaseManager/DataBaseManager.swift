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
    
    let container: NSPersistentContainer
    var context: NSManagedObjectContext {
                   container.viewContext
               }

    private init() {
               container = NSPersistentContainer(name: "Note")
               container.loadPersistentStores { description, error in
                   if let error = error {
                       fatalError("Ошибка загрузки: \(error.localizedDescription)")
                   }
               }
               container.viewContext.automaticallyMergesChangesFromParent = true
           }
    
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
    
    func createNote(title: String, text: String, status: Bool = false) {
        let note = Note(context: context)
        note.id = UUID()
        note.title = title
        note.text = text
        note.date = Date.now
        note.completed = status
        saveContext()
    }
    
//    func fetchNotes() {
//        let request = Note.fetchRequest()
//        request.sortDescriptors = [NSSortDescriptor(key: "date", ascending: true)]
//        do {
//            let notes = try context.fetch(request)
//            self.notes = notes
//        } catch {
//            print(error.localizedDescription)
//        }
//    }
    
    func updateNote(note: Note, newTitle: String = "", newText: String = "") {
        note.title = newTitle
        note.text = newText
        saveContext()
    }
    
    func updateNoteStatus(note: Note) {
            let id = note.objectID
            container.performBackgroundTask { context in
                do {
                    let noteInBackground = try context.existingObject(with: id) as? Note
                    noteInBackground?.completed.toggle()
                    try context.save()
                    DispatchQueue.main.async {
                                   let mainNote = try? self.context.existingObject(with: id) as? Note
                                   mainNote.map { self.context.refresh($0, mergeChanges: true) }
                               }
                } catch {
                    print("Ошибка обновления: \(error)")
                }
            }
        }
    
//    func deleteNote(note: Note) {
//        let context = context
//        context.delete(note)
//        saveContext()
//    }
    
//    func deleteNote(note: Note) {
//        let objectID = note.objectID
//        container.performBackgroundTask { backgroundContext in
//            do {
//                let noteToDelete = try backgroundContext.existingObject(with: objectID)
//                backgroundContext.delete(noteToDelete)
//                try backgroundContext.save()
//
//                // Обновляем main context
//                DispatchQueue.main.async {
//                    if let mainNote = try? self.context.existingObject(with: objectID) {
//                        self.context.refresh(mainNote, mergeChanges: false)
//                    }
//                }
//            } catch {
//                print("Ошибка удаления: \(error)")
//            }
//        }
//    }
    
    func deleteNote(note: Note) {
        let id = note.objectID
        container.performBackgroundTask { context in
            do {
                if let noteToDelete = try? context.existingObject(with: id) {
                    context.delete(noteToDelete)
                    try context.save()
                }
            } catch {
                print("Ошибка удаления: \(error)")
            }
        }

        DispatchQueue.main.async {
            self.context.refreshAllObjects() // Обновить состояние
        }
    }
    
    func searchNote(text: String) -> [Note] {
        let request: NSFetchRequest<Note> = Note.fetchRequest()
        
        let predicate = NSPredicate(format: "title CONTAINS[cd] %@ OR text CONTAINS[cd] %@", text, text)
        request.predicate = predicate
        
        do {
            let foundNotes = try context.fetch(request)
            return foundNotes
        } catch {
            print("Ошибка поиска: \(error)")
            return []
        }
    }
    
}

                                       

    
    
