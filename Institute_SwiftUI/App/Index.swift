//
//  Index.swift
//  Institute_SwiftUI
//
//  Created by Ali Mansour on 24/11/2025.
//

import SwiftUI

struct Index: View {
    @EnvironmentObject var session: AuthSession
    
    var body: some View {
        if let student = session.currentStudent {
            StudentHomeView(student: student)
        } else if let instructor = session.currentInstructor {
            InstructorTabView(instructor: instructor)
        } else if !session.isAuthenticated {
            Welcome()
        }
    }
}

