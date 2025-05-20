//
//  NoteEditingButtons.swift
//  ToDoListTest
//
//  Created by Marat Fakhrizhanov on 13.05.2025.
//

import SwiftUI

struct NoteEditingButtons: View {
    @ObservedObject var note: Note
    let deleteNote: (Note) -> Void
    let deleteSelectNote: () -> Void
    @State private var presentDetail = false
    @State private var presentShare = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Button {
                presentDetail.toggle()
            } label: {
                EditingButtonLabel(title: "Редактировать", imageName: "square.and.pencil", color: .black)
            }
            
            Divider()
            
            Button {
                presentShare = true
            } label: {
                EditingButtonLabel(title: "Поделиться", imageName: "square.and.arrow.up", color: .black)
            }
            
            Divider()
            
            Button {
                deleteNote(note)
            } label: {
                EditingButtonLabel(title: "Удалить", imageName: "trash", color: .red)
            }
        }
        .sheet(isPresented: $presentDetail,
               onDismiss: withAnimation(.bouncy) { deleteSelectNote },
               content: { DetailView(note: note)
                .presentationDragIndicator(.visible)
        })
        .sheet(isPresented: $presentShare, onDismiss: {
            deleteSelectNote()
        }, content: {
            ShareLinkDismissable(items: ["Задача - \(note.title), \(note.text)"], onDismiss: deleteSelectNote)
                .presentationDetents([.medium,.large])
                .presentationDragIndicator(.visible)
        })
        .padding(20)
        .background {
            RoundedRectangle(cornerRadius: 16).foregroundStyle(.appSearchItems)
        }
        .padding(.horizontal, 50)
    }
}


