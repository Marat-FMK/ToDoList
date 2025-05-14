//
//  ToolbarButton.swift
//  ToDoListTest
//
//  Created by Marat Fakhrizhanov on 10.05.2025.
//

import SwiftUI



struct ToolbarButton: View {
    let title: String
    let imageName: String
    let action: () -> Void
    let deleteSelectNote: () -> Void
    let dismiss: DismissAction
    
    var body: some View {
        Button {
            action()
            deleteSelectNote()
            dismiss()
        } label: {
            HStack(alignment: .center) {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 22)
                Text(title)
                    .font(.system(size: 22))
            }
        }
        .buttonStyle(.plain)
        .foregroundStyle(.appCheckMark)
    }
}
