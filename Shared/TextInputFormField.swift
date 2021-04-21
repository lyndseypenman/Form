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
            .keyboardType(textInputData.keyboardType ?? .default)
            .textContentType(textInputData.contentType ?? .none)
    }
}
