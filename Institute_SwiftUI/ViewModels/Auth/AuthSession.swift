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
    @Published var currentAdmin: Admin?
    
    @Published var isAuthenticated: Bool = false
    
    func loginStudent(_ student: Student){
        currentStudent = student
        currentInstructor = nil
        currentAdmin = nil
        isAuthenticated = true
    }
    
    func loginInstructor(_ instructor: Instructor) {
        currentInstructor = instructor
        currentStudent = nil
        currentAdmin = nil
        isAuthenticated = true
    }
    
    func loginAdmin(_ admin: Admin) {
        currentAdmin = admin
        currentStudent = nil
        currentInstructor = nil
        isAuthenticated = true
    }
    
    func logout(){
//        let email = currentStudent?.email ?? currentInstructor?.email

        currentStudent = nil
        currentInstructor = nil
        currentAdmin = nil
        isAuthenticated = false
        
//        if let email {
//            KeychainHelper.shared.deletePassword(email: email)
//        }
    }
    
}
