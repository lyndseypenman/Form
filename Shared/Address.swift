//
//  Address.swift
//  Form
//
//  Created by Lyndsey Penman on 21/04/2021.
//

struct Address: Codable, Equatable {
    var lineOne: String
    var lineTwo: String
    var city: String
    var postCode: String
    var country: String
}
