//
//  Offering.swift
//  Institute_SwiftUI
//
//  Created by Ali Mansour on 23/11/2025.
//

import SwiftData

final class Offering{
    var instructor: Instructor
    var course: Course
    var room: Room
    
    init(instructor: Instructor, course: Course, room: Room) {
        self.instructor = instructor
        self.course = course
        self.room = room
    }
    
}
