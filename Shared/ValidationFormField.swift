//
//  ValidationFormField.swift
//  Form
//
//  Created by Lyndsey Penman on 22/04/2021.
//

import SwiftUI

struct ValidationFormField: View {
    
    var conditionMet: Bool
    var text: String
    
    var body: some View {
        HStack(spacing: 15) {
            Image(conditionMet ? "ticked" : "crossed")
                .foregroundColor(Color.textPrimary)
            Text(text)
                .font(.bodyNormal)
                .kerning(0)
        }
    }
}
