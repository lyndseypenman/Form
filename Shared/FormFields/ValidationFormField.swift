//
//  ValidationFormField.swift
//  Form
//
//  Created by Lyndsey Penman on 22/04/2021.
//

import SwiftUI

public struct ValidationFormData {
    let conditionMet: Bool
    let text: String
}

struct ValidationFormField: View {
    
    let validationData: ValidationFormData
    
    var body: some View {
        HStack(spacing: 15) {
            Image(validationData.conditionMet ? "ticked" : "crossed")
                .foregroundColor(Color.textPrimary)
            Text(validationData.text)
                .font(.bodyNormal)
                .kerning(0)
        }
    }
}
