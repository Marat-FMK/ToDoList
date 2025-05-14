//
//  DetailView.swift
//  ToDoListTest
//
//  Created by Marat Fakhrizhanov on 08.05.2025.
//

import SwiftUI

struct DetailView: View {
    @StateObject var viewModel: DetailViewModel
    @Environment(\.dismiss) var dismiss
    let deleteSelectNote: () -> Void
    
    init(note: Note?, deleteSelectNote: @escaping () -> Void) {
        _viewModel = StateObject(wrappedValue: DetailViewModel(note: note) )
        self.deleteSelectNote = deleteSelectNote
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            TextField("", text: $viewModel.title,
                      prompt: Text("Введите заголовок")
                .foregroundStyle(.appDate)
                .font(.system(size: 25))
            )
            .foregroundStyle(.appText)
            .font(.system(size: 30))
            .bold()
            .padding(10)
            .overlay {
                RoundedRectangle(cornerRadius: 16).stroke(lineWidth: 1).foregroundStyle(.appDate)
            }
            
            Text("Время создания: \(viewModel.note?.date?.formatted() ?? Date.now.formatted())")
                .foregroundStyle(.appDate)
                .font(.system(size: 17))
            
            ZStack(alignment: .topLeading) {
                if viewModel.text.isEmpty {
                    Text("Введите текст")
                        .foregroundStyle(.appDate)
                        .font(.system(size: 25))
                        .padding(10)
                        .zIndex(1)
                }
                TextEditor(text: $viewModel.text)
                    .scrollContentBackground(.hidden)
                    .foregroundStyle(.appText)
                    .background(.appBackground)
                    .padding(10)
                    
            }
            .overlay {
                RoundedRectangle(cornerRadius: 16).stroke(lineWidth: 1).foregroundStyle(.appDate)
            }
        }
//        .onDisappear(perform: deleteSelectNote)
        .padding(20)
        .background(.appBackground)
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                //                ToolbarButton(title: "Назад", imageName: "chevron.left", action: {}, dismiss: dismiss)
                NavigationLink {
                    HomeView()
                } label: {
                    HStack {
                        Image(systemName: "chevron.left")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 22, height: 22)
                        Text("K заметкам")
                            .font(.system(size: 22))
                    }
                    .foregroundStyle(.appCheckMark)
                }

            }
            ToolbarItem(placement: .topBarTrailing) {
                if viewModel.note == nil {
                    ToolbarButton(title: "Сохранить", imageName: "square.and.arrow.down", action: viewModel.createNote, deleteSelectNote: deleteSelectNote, dismiss: dismiss)
                } else {
                    ToolbarButton(title: "Обновить", imageName: "square.and.arrow.down", action: viewModel.updateNote, deleteSelectNote: deleteSelectNote, dismiss: dismiss)
                }
            }
        }
    }
}
