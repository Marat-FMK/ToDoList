//
//  NoteEditing.swift
//  ToDoListTest
//
//  Created by Marat Fakhrizhanov on 13.05.2025.
//

import SwiftUI
import CoreData

struct NoteEditing: View {
    @Environment(\.managedObjectContext) private var context
    @State private var note: Note?
    let noteID: NSManagedObjectID
    let deleteNote: (Note) -> Void
    let deleteSelectNote: () -> Void

    var body: some View {
        VStack {
            Spacer()
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
            }
            Spacer()
        }
        .onAppear (perform: fetchNote)
    }

    private func fetchNote() {
        do {
            note = try context.existingObject(with: noteID) as? Note
        } catch {
            print("Ошибка загрузки Note по objectID: \(error)")
        }
    }
}

