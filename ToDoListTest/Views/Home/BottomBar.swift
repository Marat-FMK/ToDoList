//
//  CustomBottomBar.swift
//  ToDoListTest
//
//  Created by Marat Fakhrizhanov on 09.05.2025.
//

import SwiftUI

struct BottomBar: View {
    @Binding var notesCount: Int
    @Binding var presentDetail : Bool
    
    var body: some View {
        Spacer()
        
        ZStack(alignment: .center) {
            Rectangle()
            HStack {
                Spacer()
                HStack {
                    Text( String(notesCount))
                        .font(.system(size: 17))
                        .foregroundStyle(.appText)
                    Text("задач")
                        .font(.system(size: 17))
                        .foregroundStyle(.appText)
                }
                
                Spacer()
                
                NavigationLink {
                    DetailView()
                } label: {
                    Image(systemName: "square.and.pencil")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 22)
                        .foregroundStyle(.appCheckMark)
                }
                .padding(.trailing,20)
            }
            .padding(.leading, 44)  // ??
            
        }
        .foregroundStyle(.appBottomBar)
        .zIndex(1)
        .ignoresSafeArea()
        .frame(height: 85)
    }
}

#Preview {
    BottomBar(notesCount: .constant(7), presentDetail: .constant(false) )
}
