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
                    Text(title)
                        .font(.system(size: 22))
            }
            .buttonStyle(.plain)
            .foregroundStyle(.appCheckMark)
        }
    }

