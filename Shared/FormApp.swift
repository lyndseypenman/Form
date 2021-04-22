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
            let viewModel = ChangePasswordViewModel()
            ContentView(viewModel: viewModel)
        }
    }
}
