//
//  Note+CoreDataProperties.swift
//  ToDoListTest
//
//  Created by Marat Fakhrizhanov on 08.05.2025.
//
//

import Foundation
import CoreData


extension Note {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Note> {
        return NSFetchRequest<Note>(entityName: "Note")
    }

    @NSManaged public var title: String?
    @NSManaged public var text: String?
    @NSManaged public var completed: Bool
    @NSManaged public var date: Date?

}

extension Note : Identifiable {

}
