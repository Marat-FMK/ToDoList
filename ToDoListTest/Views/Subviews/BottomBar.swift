//
//  CustomBottomBar.swift
//  ToDoListTest
//
//  Created by Marat Fakhrizhanov on 09.05.2025.
//

import SwiftUI

struct BottomBar: View {
    let notesCount: Int
    @State var presentDetail = false
    
    var body: some View {
        Spacer()
        
        ZStack(alignment: .center) {
            Rectangle()
            HStack {
                Spacer()
                HStack {
                    Text(String(notesCount))
                        .font(.system(size: 17))
                        .foregroundStyle(.appText)
                    Text("задач")
                        .font(.system(size: 17))
                        .foregroundStyle(.appText)
                }
                
                Spacer()
                
                NavigationLink {
                    DetailView(note: nil)
                } label: {
                    Image(systemName: "square.and.pencil")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 22)
                        .foregroundStyle(.appCheckMark)
                }
                .padding(.trailing,20)
            }
            .padding(.leading, 44)
            
        }
        .foregroundStyle(.appBottomBar)
        .ignoresSafeArea()
        .frame(height: 85)
        .zIndex(1)
    }
}
