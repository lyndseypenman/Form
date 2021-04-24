//
//  ContentView.swift
//  Shared
//
//  Created by Lyndsey Penman on 20/04/2021.
//

import SwiftUI

struct ContentView<T: Equatable>: View {
    
    var viewModel: FormViewModel<T>
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: true) {
                FormView(viewModel: viewModel)
            }
            .background(Color.background.edgesIgnoringSafeArea(.all))
            .navigationBarTitle("Forms Example")
        }
    }
}
