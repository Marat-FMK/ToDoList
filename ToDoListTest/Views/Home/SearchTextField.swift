//
//  CustomSearchTextField.swift
//  ToDoListTest
//
//  Created by Marat Fakhrizhanov on 09.05.2025.
//

import SwiftUI

struct SearchTextField: View {
    @Binding var searchText: String
//    @Binding var isFocused: Bool
    @FocusState.Binding var fieldInFocused: Bool
    let search: () -> Void
    let activateRecord: () -> Void
    let clearSearchText: () -> Void
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 16)
                .foregroundStyle(.appSearchAndNoteBackground)
            
            HStack {
                Button{
                    search()
                } label: {
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 22)
                        .foregroundStyle(.appDate)
                }
                .buttonStyle(.plain)
                
                TextField("", text: $searchText, prompt: Text(searchText == "" ? "Search" : searchText).foregroundStyle(.appDate))
                    .foregroundStyle(.appDate)
                    .focused($fieldInFocused)
                    .onChange(of: searchText) {
                        search()
                    }
                
                if !searchText.isEmpty {
                    Button {
                        clearSearchText()
                    } label: {
                        Image(systemName: "xmark")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 22)
                            .foregroundStyle(.appDate)
                    }
                    .buttonStyle(.plain)
                }
                
                Button{
                    activateRecord()
                } label: {
                    Image(systemName: "microphone")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 22)
                        .foregroundStyle(.appDate)
                }
                .buttonStyle(.plain)
            }
            .padding(10)
        }
        .frame(height: 36)
        .padding(.bottom, 10)
//        .onChange(of: isFocused) { oldValue, newValue in
//            fieldInFocused = newValue
//        }
    }
}

//#Preview {
//    SearchTextField(searchText: .constant(""), fieldInFocused: .constant(false), search: { print("start search") }, activateRecord: { print("start record")}, clearSearchText: { print ("clear text")} )
//}
