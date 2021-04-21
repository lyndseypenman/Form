//
//  FormApp.swift
//  Shared
//
//  Created by Lyndsey Penman on 20/04/2021.
//

import SwiftUI

@main
struct FormApp: App {
    var body: some Scene {
        WindowGroup {
            
//            let firstName = FormField.textInput(TextInputData(keypath: \Profile.firstName, keyboardType: .default, contentType: .givenName, placeholder: "What's your first name"))
//            let lastName = FormField.textInput(TextInputData(keypath: \Profile.lastName, keyboardType: .default, contentType: .familyName, placeholder: "Last name?"))
//            let age = FormField.textInput(TextInputData(keypath: \Profile.age, keyboardType: .numberPad, contentType: nil, placeholder: "How old are you?"))
//
//            ContentView(viewModel: FormViewModel(value: Profile(firstName: "Bilbo", lastName: "Baggins", age: "45"), formFields: [firstName, lastName, age], saveCondition: { profile, originalProfile -> Bool in
//                (!profile.firstName.isEmpty && !profile.lastName.isEmpty && !profile.age.isEmpty) && profile != originalProfile
//            }))
            
            let lineOne = FormField.textInput(TextInputData(keypath: \Address.lineOne, keyboardType: .default, contentType: .streetAddressLine1, placeholder: "Line one"))
            let lineTwo = FormField.textInput(TextInputData(keypath: \Address.lineTwo, keyboardType: .default, contentType: .streetAddressLine2, placeholder: "Line two"))
            let city = FormField.textInput(TextInputData(keypath: \Address.city, keyboardType: .default, contentType: .addressCity, placeholder: "City"))
            let postCode = FormField.textInput(TextInputData(keypath: \Address.postCode, keyboardType: .default, contentType: .postalCode, placeholder: "Postcode"))
            let country = FormField.textInput(TextInputData(keypath: \Address.country, keyboardType: .default, contentType: .countryName, placeholder: "Country"))
            
            let address = Address(lineOne: "70/5 Arden Street", lineTwo: "", city: "Edinburgh", postCode: "EH9 1BN", country: "Scotland")
            
            ContentView(viewModel: FormViewModel(value: address, formFields: [lineOne, lineTwo, city, postCode, country], saveCondition: { address, originalAddress -> Bool in
                if address != originalAddress {
                    return !address.lineOne.isEmpty && !address.city.isEmpty && !address.postCode.isEmpty && !address.country.isEmpty
                } else {
                    return false
                }
            }))
        }
    }
}
