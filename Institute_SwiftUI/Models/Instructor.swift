//
//  Instructor.swift
//  Institute_SwiftUI
//
//  Created by Ali Mansour on 23/11/2025.
//

import SwiftData

@Model
final class Instructor{
    var fname: String
    var lname: String
    var phone: String
    var email: String
    
    @Relationship(inverse: \Offering.instructor)
    var offerings: [Offering] = []
    
    init(fname: String, lname: String, phone: String, email: String) {
        self.fname = fname
        self.lname = lname
        self.phone = phone
        self.email = email
    }
}
