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
    var email: String
    var password: String
    
    var university: University
    
    init(fname: String, lname: String, email: String, password: String, university: University? = nil) {
        self.fname = fname
        self.lname = lname
        self.email = email
        self.password = password
        self.university = university ?? University(name: "unidentified")
        
    }
    
    
}
