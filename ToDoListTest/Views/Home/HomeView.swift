//
//  ContentView.swift
//  ToDoListTest
//
//  Created by Marat Fakhrizhanov on 08.05.2025.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    @State private var presentDetail = false
    
    var body: some View {
        NavigationStack {
            VStack {
                VStack(alignment: .leading) {
                    Text("Задачи")
                        .foregroundStyle(.appText)
                        .font(.system(size: 40))
                        .bold()
                    
                    SearchTextField(searchText: $viewModel.searchText, search: viewModel.searchNote, activateRecord: viewModel.startRecodr)
                    
                    ScrollView( showsIndicators: false) {
                        ForEach(viewModel.notes, id: \.date) { note in
                            NoteCell(note: note, updateNoteStatus: viewModel.updateNoteStatus)
                        }
                    }
                }
                .padding(.horizontal, 20)
                
                BottomBar(notesCount: $viewModel.notesCount, presentDetail: $presentDetail)
            }
            .background(.appBackground)
        }
    }
}

#Preview {
    HomeView()
}
