//
//  FormViewModel.swift
//  Form
//
//  Created by Lyndsey Penman on 20/04/2021.
//

import SwiftUI

public enum FormField<T: Equatable> {
    case textInput(TextInputData<T>)
    case picker(PickerData<T>)
    case text(String)
    case link(LinkFormFieldData)
    case validation(ValidationFormData)
}

open class FormViewModel<T: Equatable>: ObservableObject {
    
    @Published var canSubmit = false
    @Published var formFields: [FormField<T>]
    @Published var value: T {
        didSet {
            canSubmit = saveCondition(currentValue: value, originalValue: originalValue)
        }
    }
    
    var buttonTitle: String
    let originalValue: T
    
    public init(value: T, formFields: [FormField<T>]) {
        self.formFields = formFields
        self.value = value
        self.originalValue = value
        self.buttonTitle = "Done"
        self.canSubmit = saveCondition(currentValue: value, originalValue: originalValue)
    }
    
    open func saveCondition(currentValue: T, originalValue: T) -> Bool {
        return currentValue != originalValue
    }
    
    open func save() {
        fatalError("Must be overridden by subclass")
    }
    
}
