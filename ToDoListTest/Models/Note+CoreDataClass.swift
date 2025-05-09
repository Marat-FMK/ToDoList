//
//  Note+CoreDataClass.swift
//  ToDoListTest
//
//  Created by Marat Fakhrizhanov on 09.05.2025.
//
//

import Foundation
import CoreData

@objc(Note)
public class Note: NSManagedObject {

}

extension Note {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Note> {
        return NSFetchRequest<Note>(entityName: "Note")
    }

    @NSManaged public var completed: Bool
    @NSManaged public var date: Date
    @NSManaged public var text: String
    @NSManaged public var title: String

}

extension Note : Identifiable {
    //    func deleteNote(){
    //        managedObjectContext?.delete(self)
    //        try? managedObjectContext?.save()
    //    }
}
