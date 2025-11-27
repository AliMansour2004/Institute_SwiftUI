//
//  student.swift
//  Institute_SwiftUI
//
//  Created by Ali Mansour on 23/11/2025.
//

import SwiftData

@Model
final class Student{
    var fname: String
    var lname: String
    var phone: String
    var email: String
    
    var university: University
    
    init(fname: String, lname: String, phone: String, email: String, university: University) {
        self.fname = fname
        self.lname = lname
        self.phone = phone
        self.email = email
        self.university = university
    }
    
    
}
