//
//  EditingButtonLabel.swift
//  ToDoListTest
//
//  Created by Marat Fakhrizhanov on 13.05.2025.
//

import SwiftUI

struct EditingButtonLabel: View {
    let title: String
    let imageName: String
    let color: Color
    
    var body: some View {
        HStack {
            Text(title)
                .font(.system(size: 20))
            Spacer()
            Image(systemName: imageName)
        }
        .foregroundStyle(color)
    }
}
