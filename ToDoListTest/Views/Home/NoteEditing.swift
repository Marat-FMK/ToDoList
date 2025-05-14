//
//  NoteEditing.swift
//  ToDoListTest
//
//  Created by Marat Fakhrizhanov on 13.05.2025.
//

import SwiftUI

//struct NoteEditing: View {
//    @ObservedObject var note: Note
//    let deleteNote: (Note) -> Void
////    let cancelingSelection: () -> Void
//    var body: some View {
//        VStack {
//            VStack(alignment: .leading, spacing: 10) {
//                Text(note.title)
//                    .foregroundStyle(.appText)
//                    .bold()
//                Text(note.text)
//                    .foregroundStyle(.appText)
//                    .font(.system(size: 15))
//                    .lineLimit(2)
//                Text(note.date?.formatted() ?? "no date")
//                    .foregroundStyle(.appDate)
//            }
//            .padding(15)
//            .frame(maxWidth: .infinity, alignment: .leading)
//            .background {
//                RoundedRectangle(cornerRadius: 16)
//                    .foregroundStyle(.appBottomBar)
//            }
//            .padding(20)
//            
//            NoteEditingButtons(note: note, deleteNote: deleteNote)
//        }
//    }
//}

import SwiftUI
import CoreData

struct NoteEditing: View {
    let noteID: NSManagedObjectID
    let deleteNote: (Note) -> Void
    let deleteSelectNote: () -> Void

    @Environment(\.managedObjectContext) private var context
    @State private var note: Note?

    var body: some View {
        VStack {
            if let note = note {
                VStack(alignment: .leading, spacing: 10) {
                    Text(note.title)
                        .foregroundStyle(.appText)
                        .bold()
                    Text(note.text)
                        .foregroundStyle(.appText)
                        .font(.system(size: 15))
                        .lineLimit(2)
                    Text(note.date?.formatted() ?? "no date")
                        .foregroundStyle(.appDate)
                }
                .padding(15)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background {
                    RoundedRectangle(cornerRadius: 16)
                        .foregroundStyle(.appBottomBar)
                }
                .padding(20)

                NoteEditingButtons(note: note, deleteNote: deleteNote, deleteSelectNote: deleteSelectNote)
            } else {
                Text("Заметка удалена")
                    .foregroundStyle(.gray)
                    .padding()
            }
        }
        .onAppear(perform: fetchNote)
    }

    private func fetchNote() {
        do {
            note = try context.existingObject(with: noteID) as? Note
        } catch {
            print("Ошибка загрузки Note по objectID: \(error)")
        }
    }
}

