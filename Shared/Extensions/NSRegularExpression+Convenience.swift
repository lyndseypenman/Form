//
//  NSRegularExpression+Convenience.swift
//  Form
//
//  Created by Lyndsey Penman on 22/04/2021.
//

import Foundation

extension NSRegularExpression {

    convenience init(_ pattern: String) {
        do {
            try self.init(pattern: pattern)
        } catch {
            preconditionFailure("Invalid regex: \(pattern).")
        }
    }

}
