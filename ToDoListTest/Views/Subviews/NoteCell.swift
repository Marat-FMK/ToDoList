//
//  NoteCell.swift
//  ToDoListTest
//
//  Created by Marat Fakhrizhanov on 09.05.2025.
//

import SwiftUI
import CoreData


struct NoteCell: View {
    @ObservedObject var note: Note
    @FocusState.Binding var fieldInFocused: Bool
    let updateNoteStatus: (Note) -> Void
    let selectNote: (Note) -> Void
    
    var body: some View {
        HStack(alignment: .top, spacing: 10) {
            Button {
                updateNoteStatus(note)
            } label: {
                Image(systemName: note.completed ? "checkmark.circle" : "circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 22)
                    .foregroundStyle(note.completed ? .appCheckMark : .appText)
            }
            ZStack(alignment: .leading) {
                Color.clear
                    .contentShape(Rectangle())
                    .onTapGesture {
                        withAnimation {
                            fieldInFocused = false
                            selectNote(note)
                        }
                    }
                VStack(alignment: .leading, spacing: 5) {
                    if note.completed {
                        Text("~\(note.title)~")
                            .font(.system(size: 20))
                            .bold()
                            .foregroundStyle(.appDate)
                            .lineLimit(1)
                    }else {
                        Text(note.title)
                            .font(.system(size: 20))
                            .bold()
                            .foregroundStyle(.appText)
                            .lineLimit(1)
                    }
                    Text(note.text)
                        .foregroundStyle(note.completed ? .appDate : .appText)
                        .lineLimit(2)
                    
                    Text(note.date?.toString() ?? "no date")
                        .foregroundStyle(.appDate)
                }
            }
            .background {
                RoundedRectangle(cornerRadius: 16)
                    .foregroundStyle(.appBackGround)
            }
            Spacer()
        }
        Divider()
    }
}
