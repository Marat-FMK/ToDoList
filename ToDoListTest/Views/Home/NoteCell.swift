//
//  NoteCell.swift
//  ToDoListTest
//
//  Created by Marat Fakhrizhanov on 09.05.2025.
//

import SwiftUI

//struct NoteT {
//    let text: String
//    let tytle: String
//    let completed: Bool
//    let date: Date
//}

struct NoteCell: View {
    let note: Note
    let updateNoteStatus: () -> Void
    
    var body: some View {
        Group {
            HStack(alignment: .top, spacing: 10) {
                
                Image(systemName: note.completed ? "checkmark.circle" : "circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 22)
                    .foregroundStyle(note.completed ? .appCheckMark : .appText)
                
                VStack(alignment: .leading, spacing: 5) {
                    Text(note.title ?? "")
                        .foregroundStyle( note.completed ? .appDate : .appText)
                        .lineLimit(1)
                    Text(note.text ?? "")
                        .foregroundStyle( note.completed ? .appDate : .appText)
                        .lineLimit(2)
                    Text(String(note.date?.formatted() ?? "")) // ???
                        .foregroundStyle( note.completed ? .appDate : .appText)
                }
                Spacer()
            }
            Divider()
        }
    }
}

//#Preview {
//    NoteCell( note: Note, updateNoteCheckmark: { print("checkmark upload") })
//}
