//
//  StyledTextField.swift
//  Form
//
//  Created by Lyndsey Penman on 21/04/2021.
//

import SwiftUI

struct StyledTextField: TextFieldStyle {
    
    let keyboardType: UIKeyboardType?
    let content: UITextContentType?
    
    func _body(configuration: TextField<_Label>) -> some View {
        configuration
            .bodyLarge()
            .keyboardType(keyboardType ?? .default)
            .textContentType(content ?? .none)
    }
}

struct BodyLargeText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("Avenir-Book", size: 18, relativeTo: .body))
            .foregroundColor(Color.textPrimary)
    }
}

extension View {
    func bodyLarge() -> some View {
        self.modifier(BodyLargeText())
    }
}
