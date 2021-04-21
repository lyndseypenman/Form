//
//  FormViewModel.swift
//  Form
//
//  Created by Lyndsey Penman on 20/04/2021.
//

import SwiftUI

enum FormField<T: Codable> {
    case textInput(TextInputData<T>)
    case picker(PickerData<T>)
    case text(String)
    case link(LinkFormFieldData)
}

class FormViewModel<T: Codable>: ObservableObject {
    
    @Published var canSaveForm = false
    @Published var formFields: [FormField<T>]
    @Published var value: T {
        didSet {
            canSaveForm = saveCondition(value, originalValue)
        }
    }
    
    var buttonTitle: String
    
    private let saveCondition: (T, T) -> Bool
    private let originalValue: T
    
    init(value: T, formFields: [FormField<T>], saveCondition: @escaping (T, T) -> Bool) {
        self.formFields = formFields
        self.saveCondition = saveCondition
        self.value = value
        self.originalValue = value
        self.canSaveForm = saveCondition(value, originalValue)
        self.buttonTitle = "Done"
    }
    
}
