//
//  ShareLinkDismissable.swift
//  ToDoListTest
//
//  Created by Marat Fakhrizhanov on 20.05.2025.
//

import UIKit
import SwiftUI

struct ShareLinkDismissable: UIViewControllerRepresentable {
    let items: [Any]
    let onDismiss: () -> Void
    
    func makeUIViewController(context: Context) -> UIActivityViewController {
        let controller = UIActivityViewController(activityItems: items, applicationActivities: nil)
        controller.completionWithItemsHandler = { _ ,_ ,_ ,_ in
            onDismiss()
        }
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) { }
}
