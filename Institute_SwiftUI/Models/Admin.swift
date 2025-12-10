//
//  Admin.swift
//  Institute_SwiftUI
//
//  Created by Ali Mansour on 30/11/2025.
//

import SwiftData

@Model
final class Admin{
    var fname: String
    var lname: String
    var phone: String
    var email: String
    var password: String
    
    init(
        fname: String = "Admin",
        lname: String = "Ali",
        phone: String = "+96170240761",
        email: String = "ali.a.mansour@gmail.com",
        password: String = "P@ssw0rd"
    ) {
        self.fname = fname
        self.lname = lname
        self.phone = phone
        self.email = email
        self.password = password

        KeychainHelper.shared.savePassword(password, email: email)
    }
    
}
