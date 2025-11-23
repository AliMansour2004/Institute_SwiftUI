//
//  Course.swift
//  Institute_SwiftUI
//
//  Created by Ali Mansour on 23/11/2025.
//

import SwiftData

@Model
final class Course{
    var title: String
    
    @Relationship(inverse: \University.courses)
    var universities: [University] = []
    
    init(title: String) {
        self.title = title
    }
}
