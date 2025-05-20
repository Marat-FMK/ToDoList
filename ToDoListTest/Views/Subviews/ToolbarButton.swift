//
//  ToolbarButton.swift
//  ToDoListTest
//
//  Created by Marat Fakhrizhanov on 10.05.2025.
//

import SwiftUI

enum ButtonDestiny {
    case back
    case save
}

struct ToolbarButton: View {
    let destiny: ButtonDestiny
    let title: String
    let icon: String?
    let save: () -> Void
    let dismiss: DismissAction
    
    var body: some View {
        Button {
            if destiny == .save {
                save()
                dismiss()
            } else {
                dismiss()
            }
        } label: {
            if let icon = icon {
                Image(systemName: icon)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 22)
            }
            Text(title)
                .font(.system(size: 22))
        }
        .buttonStyle(.plain)
        .foregroundStyle(.appCheckMark)
    }
}

