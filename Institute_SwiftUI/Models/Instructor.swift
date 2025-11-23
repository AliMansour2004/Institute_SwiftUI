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
    
    init(fname: String, lname: String) {
        self.fname = fname
        self.lname = lname
    }
}
