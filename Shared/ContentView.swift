//
//  ContentView.swift
//  Shared
//
//  Created by Lyndsey Penman on 20/04/2021.
//

import SwiftUI

struct ContentView<T: Codable>: View {
    
    @ObservedObject var viewModel: FormViewModel<T>
    
    var body: some View {
        Form {
            ForEach(0..<viewModel.formFields.count, id: \.self) {
                switch viewModel.formFields[$0] {
                case .textInput(let data):
                    TextInputFormField(textInputData: data)
                case .picker(let data):
                    PickerFormField(pickerData: data)
                }
            }
        }
        .environmentObject(viewModel)
        Spacer()
        Button("Save") {
            print("Saving data")
        }
        .disabled(!viewModel.canSaveForm)
    }
}
