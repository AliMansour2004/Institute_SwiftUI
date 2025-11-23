//
//  university.swift
//  Institute_SwiftUI
//
//  Created by Ali Mansour on 23/11/2025.
//

import SwiftData

@Model
final class University {
    
    @Relationship(deleteRule: .cascade, inverse: \Student.university)
    var students: [Student] = []
    
    @Relationship
    var courses: [Course] = []
    
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
}

