//
//  ChangePasswordViewModel.swift
//  Form
//
//  Created by Lyndsey Penman on 22/04/2021.
//

import SwiftUI

class ChangePasswordViewModel: FormViewModel<ChangePassword> {
    
    override var value: ChangePassword {
        didSet {
            canSubmit = saveCondition(currentValue: value, originalValue: originalValue)
            self.formFields = refreshFields(for: value)
        }
    }
    
    init() {
        let changePassword = ChangePassword(originalPassword: "", newPassword: "", confirmedPassword: "")
        super.init(value: changePassword, formFields: [])
        self.value = changePassword
        self.buttonTitle = "Next"
    }
    
    override func saveCondition(currentValue: ChangePassword, originalValue: ChangePassword) -> Bool {
        let allContainValue = [currentValue.originalPassword,
                               currentValue.newPassword,
                               currentValue.confirmedPassword]
            .allSatisfy { !$0.isEmpty }
        let passwordRegex = "\\A(?=.{8,}\\z)(?=[^a-z]*[a-z])(?=[^A-Z]*[A-Z])(?=\\D*\\d).*"
        let regex = NSRegularExpression(passwordRegex)
        let newPasswordValid = regex.matches(currentValue.newPassword)
        let matchingPasswords = currentValue.newPassword == currentValue.confirmedPassword
        return allContainValue && newPasswordValid && matchingPasswords
    }
    
    override func save() {
        print("saving passwords")
    }
    
    private func refreshFields(for updated: ChangePassword) -> [FormField<ChangePassword>] {
        let originalPassword = FormField.textInput(TextInputData(keypath: \ChangePassword.originalPassword, keyboardType: .default, contentType: .password, autocorrectType: .none, placeholder: "Current password", maxCharacters: nil))
        let newPassword = FormField.textInput(TextInputData(keypath: \ChangePassword.newPassword, keyboardType: .default, contentType: .newPassword, autocorrectType: .none, placeholder: "New password", maxCharacters: nil))
        let confirmPassword = FormField.textInput(TextInputData(keypath: \ChangePassword.confirmedPassword, keyboardType: .default, contentType: .newPassword, autocorrectType: .none, placeholder: "Confirm password", maxCharacters: nil))
        
        let oneNumberRegex = ".*\\d.*"
        let oneUppercaseRegex = ".*[A-Z].*"
        let oneLowercaseRegex = ".*[a-z].*"
        let eightCharactersRegex = ".{8,}.*"
        
        let passwordDescription = FormField<ChangePassword>.text("New password must contain:")
        let matching = FormField<ChangePassword>.validation(ValidationFormData(conditionMet: value.newPassword == value.confirmedPassword, text: "Passwords match"))
        let characters = FormField<ChangePassword>.validation(ValidationFormData(conditionMet: validate(password: value.newPassword, matches: eightCharactersRegex), text: "8 characters"))
        let uppercase = FormField<ChangePassword>.validation(ValidationFormData(conditionMet: validate(password: value.newPassword, matches: oneUppercaseRegex), text: "1 uppercase"))
        let lowercase = FormField<ChangePassword>.validation(ValidationFormData(conditionMet: validate(password: value.newPassword, matches: oneLowercaseRegex), text: "1 lowercase"))
        let number = FormField<ChangePassword>.validation(ValidationFormData(conditionMet: validate(password: value.newPassword, matches: oneNumberRegex), text: "1 number"))
        
        return [originalPassword, newPassword, confirmPassword, passwordDescription, matching, characters, uppercase, lowercase, number]
    }
    
    private func validate(password: String, matches regex: String) -> Bool {
        let regex = NSRegularExpression(regex)
        return regex.matches(password)
    }
    
}
