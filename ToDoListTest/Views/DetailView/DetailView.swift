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
    
    init(note: Note?) {
        _viewModel = StateObject(wrappedValue: DetailViewModel(note: note) )
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
            
            Text("Время создания: \(viewModel.note?.date?.toString() ?? Date.now.toString())")
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
        .onDisappear(perform: viewModel.updateNote)
        .padding(20)
        .background(.appBackground)
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                ToolbarButton(destiny: .back, title: "Заметки", save: {}, dismiss: dismiss)
            }
            ToolbarItem(placement: .topBarTrailing) {
                if !viewModel.title.isEmpty {
                    ToolbarButton(destiny: .save, title: "Сохранить", save: viewModel.createNote, dismiss: dismiss)
                }
            }
        }
    }
}
