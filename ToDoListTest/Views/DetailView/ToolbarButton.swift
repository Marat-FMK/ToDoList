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
    let visible: Bool
    let action: () -> Void
    let dismiss: DismissAction
    
    var body: some View {
        if visible {
            Button {
                action()
                dismiss()
            } label: {
                HStack {
                    Image(systemName: imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 22)
                    Text(title)
                        .font(.system(size: 17))
                }
            }
            .buttonStyle(.plain)
            .foregroundStyle(.appCheckMark)
        }
    }
}
