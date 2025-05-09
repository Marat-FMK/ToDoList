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
            TextField("", text: $viewModel.title, prompt: Text("Заголовок").foregroundStyle(.appDate))
                .foregroundStyle(.appText)
                .font(.system(size: 40))
                .bold()
            Text(viewModel.note?.date.formatted() ?? Date.now.formatted())
                .foregroundStyle(.appDate)
                .font(.system(size: 17))
            TextEditor(text: $viewModel.text)
                .background(.appBackground)
                .foregroundStyle(.appText)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .padding(.horizontal,20)
        .background(.appBackground)
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                ToolbarButton(title: "Назад",
                              imageName: "chevron.left",
                              visible: true,
                              action: viewModel.updateNote,
                              dismiss: dismiss)
            }
            ToolbarItem(placement: .topBarTrailing) {
                ToolbarButton(title: "Сохранить",
                              imageName: "square.and.arrow.down",
                              visible: (viewModel.note != nil) ? false : true,
                              action: viewModel.createNote,
                              dismiss: dismiss)
            }
            
        }
    }
}
