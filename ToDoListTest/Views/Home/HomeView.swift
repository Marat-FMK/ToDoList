//
//  ContentView.swift
//  ToDoListTest
//
//  Created by Marat Fakhrizhanov on 08.05.2025.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
//    @Environment(\.managedObjectContext) private var context
    @FetchRequest(
        entity: Note.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \Note.date, ascending: true)]
    ) var notes: FetchedResults<Note>
    
    var body: some View {
        NavigationStack {
            VStack {
                VStack(alignment: .leading) {
                    Text("Задачи")
                        .foregroundStyle(.appText)
                        .font(.system(size: 40))
                        .bold()
                    
                    SearchTextField(searchText: $viewModel.searchText, search: viewModel.searchNote, activateRecord: viewModel.startRecodr)
                    
                    ScrollView {
                        ForEach(notes) { note in
                            NoteCell(note: note, updateNoteStatus: viewModel.updateNoteStatus)
                        }
                    }
                }
                .padding(.horizontal, 20)
                
                BottomBar(notesCount: notes.count)
            }
            .background(.appBackground)
        }
    }
}

#Preview {
    HomeView()
}
