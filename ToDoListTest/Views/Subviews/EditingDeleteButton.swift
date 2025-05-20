//
//  EditingDeleteButton.swift
//  ToDoListTest
//
//  Created by Marat Fakhrizhanov on 20.05.2025.
//

import SwiftUI

struct EditingDeleteButton: View {
    let note: Note
    let title: String
    let imageName: String
    let color: Color
    let deleteAction: (Note) -> Void
    
    var body: some View {
        Button{
            deleteAction(note)
        } label: {
            EditingButtonLabel(title: title, imageName: imageName, color: color)
        }
    }
}
