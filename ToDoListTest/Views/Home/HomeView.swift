//
//  ContentView.swift
//  ToDoListTest
//
//  Created by Marat Fakhrizhanov on 08.05.2025.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    @FocusState var isSearchFieldFocused: Bool
    @FetchRequest(
        entity: Note.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \Note.date, ascending: false)],
        animation: .bouncy(duration: 0.2, extraBounce: 0.4)
    ) var notes: FetchedResults<Note>
    
    var body: some View {
        NavigationStack {
            ZStack {
                if let note = viewModel.selectedNote {
                    Color.clear
                        .contentShape(Rectangle())
                        .onTapGesture {
                            isSearchFieldFocused = false
                            viewModel.clearSelectNote()
                        }
                        .zIndex(1)
                    NoteEditing(noteID: note.objectID, deleteNote: viewModel.deleteNote, deleteSelectNote: viewModel.clearSelectNote)
                        .zIndex(2)
                }
                VStack {
                    VStack(alignment: .leading) {
                        Text("Задачи")
                            .foregroundStyle(.appText)
                            .font(.system(size: 40))
                            .bold()
                        
                        SearchTextField(searchText: $viewModel.searchText, fieldInFocused: $isSearchFieldFocused, search: viewModel.searchNote, activateRecord: viewModel.startRecodr, clearSearchText: viewModel.clearSearchText)
                        
                        ScrollView {
                            if viewModel.searchedNotes.isEmpty && viewModel.searchText.isEmpty {
                                ForEach(notes) { note in
                                    NoteCell(note: note, fieldInFocused: $isSearchFieldFocused, updateNoteStatus: viewModel.updateNoteStatus, selectNote: viewModel.selectNote)
                                }
                            } else {
                                ForEach(viewModel.searchedNotes) { note in
                                    NoteCell(note: note, fieldInFocused: $isSearchFieldFocused, updateNoteStatus: viewModel.updateNoteStatus, selectNote: viewModel.selectNote)
                                }
                            }
                        }
                    }
                    .padding(.horizontal, 20)
                    
                    BottomBar(notesCount: notes.count)
                }
                .background(.appBackGround)
                .blur(radius: CGFloat(viewModel.blurValue))
                .contentShape(Rectangle())
                .onTapGesture {
                    isSearchFieldFocused = false
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
