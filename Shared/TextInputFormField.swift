//
//  TextInputFormField.swift
//  Form
//
//  Created by Lyndsey Penman on 20/04/2021.
//

import SwiftUI

struct TextInputData<T: Codable> {
    var keypath: WritableKeyPath<T, String>
    let keyboardType: UIKeyboardType?
    let contentType: UITextContentType?
    let placeholder: String
}

struct TextInputFormField<T: Codable>: View {
    
    @EnvironmentObject var viewModel: FormViewModel<T>
    
    let textInputData: TextInputData<T>
    
    var body: some View {
        TextField(textInputData.placeholder,
                  text: $viewModel.value[dynamicMember: textInputData.keypath])
            .textFieldStyle(CustomTextFieldStyle(
                                keyboardType: textInputData.keyboardType,
                                content: textInputData.contentType))
    }
}

struct CustomTextFieldStyle: TextFieldStyle {
    
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
            .background(Color.init(.sRGB, red: 12, green: 18, blue: 28, opacity: 1))
    }
}

extension View {
    func bodyLarge() -> some View {
        self.modifier(BodyLargeText())
    }
}
