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
            let lineOne = FormField.textInput(TextInputData(keypath: \Address.lineOne, keyboardType: .default, contentType: .streetAddressLine1, placeholder: "Line one", maxCharacters: 40))
            let lineTwo = FormField.textInput(TextInputData(keypath: \Address.lineTwo, keyboardType: .default, contentType: .streetAddressLine2, placeholder: "Line two", maxCharacters: 40))
            let city = FormField.textInput(TextInputData(keypath: \Address.city, keyboardType: .default, contentType: .addressCity, placeholder: "City", maxCharacters: 40))
            let postCode = FormField.textInput(TextInputData(keypath: \Address.postCode, keyboardType: .default, contentType: .postalCode, placeholder: "Postcode", maxCharacters: 40))
            let country = FormField.picker(PickerData(choices: ["UK", "USA", "Austria", "Germany"], placeholder: "Country (select)", keypath: \Address.country))
            let disclaimer = FormField<Address>.text("By continuing I agree that I have read and agree to Jaguar Land Rover's Terms & Conditions and Privacy Policy.")
            let terms = FormField<Address>.link(LinkFormFieldData(text: "Terms & Conditions", content: "Here are the Terms & Conditions"))
            let privacy = FormField<Address>.link(LinkFormFieldData(text: "Privacy Policy", content: "Here is the Privacy Policy"))
            
            let address = Address(lineOne: "70/5 Arden Street", lineTwo: "", city: "Edinburgh", postCode: "EH9 1BN", country: "Austria")
            
            ContentView(viewModel: FormViewModel(value: address, formFields: [lineOne, lineTwo, city, postCode, country, disclaimer, terms, privacy], saveCondition: { address, originalAddress -> Bool in
                if address != originalAddress {
                    return !address.lineOne.isEmpty && !address.city.isEmpty && !address.postCode.isEmpty && !address.country.isEmpty
                } else {
                    return false
                }
            }))
        }
    }
}
