//
//  PickerFormField.swift
//  Form
//
//  Created by Lyndsey Penman on 21/04/2021.
//

import SwiftUI

struct PickerData<T: Codable> {
    let choices: [String]
    let placeholder: String
    let keypath: WritableKeyPath<T, String>
}

struct PickerFormField<T: Codable>: View {
    
    @EnvironmentObject var viewModel: FormViewModel<T>
    
    @State private var showPicker = false
    @State private var pickerSelection: Int?
    
    let pickerData: PickerData<T>
    
    var body: some View {
        VStack {
            TextField(pickerData.placeholder, text: $viewModel.value[dynamicMember: pickerData.keypath]) { editing in
                showPicker = editing
            }
            if showPicker {
                Picker(pickerData.placeholder,
                       selection: $viewModel.value[dynamicMember: pickerData.keypath]) {
                    ForEach(pickerData.choices, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(InlinePickerStyle())
            }
        }
    }
}
