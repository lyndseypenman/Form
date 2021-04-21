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
    let maxCharacters: Int?
}

struct TextInputFormField<T: Codable>: View {
    
    @EnvironmentObject var viewModel: FormViewModel<T>
    
    let textInputData: TextInputData<T>
    
    var body: some View {
        VStack {
            TextField(textInputData.placeholder,
                      text: $viewModel.value[dynamicMember: textInputData.keypath])
                .textFieldStyle(CustomTextFieldStyle(
                                    keyboardType: textInputData.keyboardType,
                                    content: textInputData.contentType))
            if let maxCharacters = textInputData.maxCharacters {
                let characterCount = viewModel.value[keyPath: textInputData.keypath].count
                let valid = characterCount <= maxCharacters
                VStack(alignment: .trailing, spacing: 3) {
                    Divider()
                        .frame(minHeight: 1)
                        .background(valid ? Color.divider : Color.alertError)
                    Text("\(characterCount)/\(maxCharacters)")
                        .foregroundColor(valid ? Color.divider : Color.alertError)
                        .font(.captionCustom)
                        .kerning(0)
                }
            } else {
                Divider()
                    .frame(minHeight: 1)
                    .background(Color.divider)
            }
        }
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
            .foregroundColor(Color.textPrimary)
    }
}

extension View {
    func bodyLarge() -> some View {
        self.modifier(BodyLargeText())
    }
}
