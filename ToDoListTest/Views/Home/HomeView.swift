//
//  ContentView.swift
//  ToDoListTest
//
//  Created by Marat Fakhrizhanov on 08.05.2025.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    @Environment(\.managedObjectContext) private var context
    @FetchRequest(
        entity: Note.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \Note.date, ascending: false)]
    ) var notes: FetchedResults<Note>
    
    var body: some View {
        NavigationStack {
            ZStack {
                if viewModel.editing {
                    if let note = viewModel.selectedNote {
                        NoteEditing(note: note, deleteNote: viewModel.deleteNote)
                            .zIndex(1)
                    }
                }
                    VStack {
                        VStack(alignment: .leading) {
                            Text("Задачи")
                                .foregroundStyle(.appText)
                                .font(.system(size: 40))
                                .bold()
                            
                            SearchTextField(searchText: $viewModel.searchText, search: viewModel.searchNote, activateRecord: viewModel.startRecodr, clearSearchText: viewModel.clearSearchText)
                            
                            ScrollView {
                                if viewModel.searchedNotes.isEmpty && viewModel.searchText.isEmpty {
                                    ForEach(notes) { note in
                                        NoteCell(note: note, updateNoteStatus: viewModel.updateNoteStatus, selectNote: viewModel.selectNote)
                                    }
                                } else {
                                    ForEach(viewModel.searchedNotes) { note in
                                        NoteCell(note: note, updateNoteStatus: viewModel.updateNoteStatus, selectNote: viewModel.selectNote)
                                    }
                                }
                            }
                        }
                        .padding(.horizontal, 20)
                        
                        BottomBar(notesCount: notes.count)
                    }
                    .background(.appBackground)
                    .blur(radius: CGFloat(viewModel.blurValue))
                
            }
        }
    }
}

#Preview {
    HomeView()
}
