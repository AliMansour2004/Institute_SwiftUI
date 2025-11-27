//
//  AuthSession.swift
//  Institute_SwiftUI
//
//  Created by Ali Mansour on 27/11/2025.
//

import SwiftUI
import Combine

@MainActor
final class AuthSession: ObservableObject {
    @Published var currentStudent: Student?
    @Published var currentInstructor: Instructor?
    
    @Published var isAuthenticated: Bool = false
    
    func loginStudent(_ student: Student){
        currentStudent = student
        currentInstructor = nil
        isAuthenticated = true
    }
    
    func loginInstructor(_ instructor: Instructor) {
        currentInstructor = instructor
        currentStudent = nil
        isAuthenticated = true
    }
    
    func logout(){
        currentStudent = nil
        currentInstructor = nil
        isAuthenticated = false
    }
    
}
