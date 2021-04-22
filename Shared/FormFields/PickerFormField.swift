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
    
    let pickerData: PickerData<T>
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack(spacing: 10) {
                Text(viewModel.value[keyPath: pickerData.keypath])
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .onTapGesture {
                        showPicker.toggle()
                    }
                    .bodyLarge()
                Divider()
                    .frame(minHeight: 1)
                    .background(Color.divider)
            }
            if showPicker {
                Picker(pickerData.placeholder,
                       selection: $viewModel.value[dynamicMember: pickerData.keypath]) {
                    ForEach(pickerData.choices, id: \.self) {
                        Text($0)
                            .bodyLarge()
                    }
                }
                .pickerStyle(InlinePickerStyle())
            }
        }
    }
}
