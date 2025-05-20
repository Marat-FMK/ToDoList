//
//  EditingButon.swift
//  ToDoListTest
//
//  Created by Marat Fakhrizhanov on 20.05.2025.
//

import SwiftUI

struct EditingButton: View {
    @Binding var present: Bool
    let title: String
    let imageName: String
    let color: Color
    
    var body: some View {
        Button{
            present.toggle()
        } label: {
            EditingButtonLabel(title: title, imageName: imageName, color: color)
        }
    }
}
