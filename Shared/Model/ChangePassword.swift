//
//  ChangePassword.swift
//  Form
//
//  Created by Lyndsey Penman on 21/04/2021.
//

import Foundation

struct ChangePassword: Codable {
    var originalPassword: String
    var newPassword: String
    var confirmedPassword: String
}
