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
                       fatalError("Error -loading: \(error.localizedDescription)")
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
                fatalError("Error - unresolved error to saveContext \(error), \(nserror.userInfo)")
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
                    print("Error - error update status \(error)")
                }
            }
        }
    
    func deleteNote(note: Note) {
        let id = note.objectID
        container.performBackgroundTask { context in
            do {
                if let noteToDelete = try? context.existingObject(with: id) {
                    context.delete(noteToDelete)
                    try context.save()
                }
            } catch {
                print("Error - deleteNote \(error)")
            }
        }
        DispatchQueue.main.async {
            self.context.refreshAllObjects()
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
            print("Error - searchNote \(error)")
            return []
        }
    }
    
}

                                       

    
    
