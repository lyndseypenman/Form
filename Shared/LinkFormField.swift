//
//  LinkFormField.swift
//  Form
//
//  Created by Lyndsey Penman on 21/04/2021.
//

import SwiftUI

struct LinkFormFieldData {
    let text: String
    let content: String
}

struct LinkFormField: View {
    
    var linkData: LinkFormFieldData
    @State var showingContent = false
    
    var body: some View {
        HStack(spacing: 15) {
            Image("iGuide")
                .foregroundColor(Color.primary)
            Button {
                showingContent.toggle()
            } label: {
                Text(linkData.text)
                    .font(.subtitleSmall)
                    .kerning(0)
                    .foregroundColor(Color.primary)
            }
        }
        .sheet(isPresented: $showingContent) {
            VStack {
                Text(linkData.content)
                    .font(.bodyNormal)
                    .kerning(0)
                    .background(Color.background)
                    .foregroundColor(Color.textPrimary)
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .background(Color.background.edgesIgnoringSafeArea(.all))
        }
    }
    
}
