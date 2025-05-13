//
//  NoteEditingButtons.swift
//  ToDoListTest
//
//  Created by Marat Fakhrizhanov on 13.05.2025.
//

import SwiftUI

import SwiftUI

struct NoteEditingButtons: View {
    @ObservedObject var note: Note
    let deleteNote: (Note) -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            NavigationLink {
                DetailView(note: note)
            } label: {
                EditingButtonLabel(title: "Редактировать", imageName: "square.and.pencil", color: .black)
            }
            
            Divider()
            ShareLink( item: "Задача - \(note.title),  \(note.text)") {
                EditingButtonLabel(title: "Поделиться", imageName: "square.and.arrow.up", color: .black)
            }
            Divider()
            
            Button {
                deleteNote(note)
            } label: {
                EditingButtonLabel(title: "Удалить", imageName: "trash", color: .red)
            }
        }
        .padding(20)
        .background {
            RoundedRectangle(cornerRadius: 16).foregroundStyle(.appSearchItems)
        }
        .padding(.horizontal, 50)
    }
}
