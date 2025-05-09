//
//  CustomSearchTextField.swift
//  ToDoListTest
//
//  Created by Marat Fakhrizhanov on 09.05.2025.
//

import SwiftUI

struct CustomSearchTextField: View {
    @Binding var searchText: String
    let search: ()-> Void
    let activateRecord: () -> Void
    
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
                
                TextField(searchText == "" ? "Search" : searchText, text: $searchText)
                
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
    }
}

#Preview {
    CustomSearchTextField(searchText: .constant("Уборка"), search: { print("start search") }, activateRecord: { print("start record")} )
}
