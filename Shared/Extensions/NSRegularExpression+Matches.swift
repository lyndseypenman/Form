//
//  NSRegularExpression+Matches.swift
//  Form
//
//  Created by Lyndsey Penman on 22/04/2021.
//

import Foundation

public extension NSRegularExpression {

    func matches(_ string: String) -> Bool {
        let range = NSRange(location: 0, length: string.utf16.count)
        return firstMatch(in: string, options: [], range: range) != nil
    }

}
