//
//  User.swift
//  MIFood
//
//  Created by Илья Морозов on 18.03.2025.
//

import Foundation

struct User: Codable {
    var firstName: String = ""
    var lastName: String = ""
    var email: String = ""
    var birthDate: Date = Date()
    var extraNapkins: Bool = false
    var frequentRefills: Bool = true
}
