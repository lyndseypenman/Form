//
//  PrimaryButton.swift
//  Form
//
//  Created by Lyndsey Penman on 21/04/2021.
//

import SwiftUI

struct PrimaryButton: ButtonStyle {
    
    let isEnabled: Bool
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity)
            .padding([.top, .bottom], 20)
            .padding(EdgeInsets(top: 0, leading: 26, bottom: 0, trailing: 26))
            .font(.button)
            .background(isEnabled ? (configuration.isPressed ? Color.primarySelected : Color.primary) : Color.primaryDisabled)
            .foregroundColor(isEnabled ? Color.textOnPrimary : Color.textOnPrimaryDisabled)
            .border(isEnabled ? Color.primaryBorder : Color.primaryDisabledBorder, width: 2)
    }
}
