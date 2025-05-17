//
//  Extension + Data.swift
//  ToDoListTest
//
//  Created by Marat Fakhrizhanov on 17.05.2025.
//

import Foundation

extension Date {
    func toString(format: String = "dd/MM/yyyy") -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}
