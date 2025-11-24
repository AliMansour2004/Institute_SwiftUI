//
//  Offering.swift
//  Institute_SwiftUI
//
//  Created by Ali Mansour on 23/11/2025.
//

import Foundation
import SwiftData

@Model
final class Offering{
    var instructor: Instructor
    var course: Course
    var room: Room
    var date: Date
    var time: Date
    var duration: Int
    
    init(instructor: Instructor, course: Course, room: Room, date: Date, time: Date, duration: Int) {
        self.instructor = instructor
        self.course = course
        self.room = room
        self.date = date
        self.time = time
        self.duration = duration
    }
    
    
}
