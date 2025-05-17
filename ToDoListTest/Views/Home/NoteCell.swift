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
    let updateNoteStatus: (Note) -> Void
    let selectNote: (Note) -> Void

    var body: some View {
        Group {
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

                    Text(note.date?.formatted(date: .complete, time: .omitted) ?? "no date")
                        .foregroundStyle(.appDate)
                }
                .background {
                    RoundedRectangle(cornerRadius: 16)
                }
                .onTapGesture {
                    withAnimation {
                        selectNote(note)
                    }
                }
                Spacer()
            }
            Divider()
        }
    }
}
