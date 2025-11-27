//
//  Index.swift
//  Institute_SwiftUI
//
//  Created by Ali Mansour on 24/11/2025.
//

import SwiftUI

struct Index: View {
//    @EnvironmentObject var auth: AuthViewModel
    
    enum StudentTab: Hashable {
        case StudentHome, Offerings ,StudentProfile, Settings
    }
    
    enum InstructorTab: Hashable {
        case InstructorHome, Courses ,InstructorProfile, Settings
    }
    

    
    var body: some View {
//        if let student = auth.currentStudent {
//            StudentHomeView(student: student)
//        } else if let instructor = auth.currentInstructor {
//            InstructorHomeView(instructor: instructor)
//        }
    }
}

