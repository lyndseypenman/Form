//
//  Font+Custom.swift
//  Form
//
//  Created by Lyndsey Penman on 21/04/2021.
//

import SwiftUI

extension Font {
    static var button: Font {
        .custom("Avenir-Heavy", size: 14, relativeTo: .callout)
    }
    
    static var captionCustom: Font {
        .custom("Avenir-Book", size: 12, relativeTo: .caption)
    }
}
