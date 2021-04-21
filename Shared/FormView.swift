//
//  FormView.swift
//  Form
//
//  Created by Lyndsey Penman on 21/04/2021.
//

import SwiftUI

struct FormView<T: Codable>: View {
    
    @ObservedObject var viewModel: FormViewModel<T>
    
    var body: some View {
        VStack(alignment: .leading, spacing: 60) {
            VStack(alignment: .leading, spacing: 30) {
                ForEach(0..<viewModel.formFields.count, id: \.self) {
                    switch viewModel.formFields[$0] {
                    case .textInput(let data):
                        TextInputFormField(textInputData: data)
                    case .picker(let data):
                        PickerFormField(pickerData: data)
                    case .link(let data):
                        LinkFormField(linkData: data)
                    case .text(let text):
                        Text(text)
                            .font(.bodyNormal)
                            .kerning(0)
                            .foregroundColor(Color.textPrimary)
                    }
                }
            }
            Button {
                print("Saving data")
            } label: {
                Text(viewModel.buttonTitle.localizedUppercase)
                    .font(.button)
                    .kerning(2.5)
            }
            .buttonStyle(PrimaryButton(isEnabled: viewModel.canSaveForm))
            .disabled(!viewModel.canSaveForm)
            Spacer()
        }
        .padding(EdgeInsets(top: 30, leading: 26, bottom: 30, trailing: 26))
        .environmentObject(viewModel)
    }
}
