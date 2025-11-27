//
//  AppStrings.swift
//  Institute_SwiftUI
//
//  Created by Ali Mansour on 24/11/2025.
//

enum AppStrings{
    enum TabTitle{
        static let StudentHome = "Home"
        static let StudentProfile = "Profile"
        static let StudentOfferings = "Offerings"
        
        
        static let InstructorHome = "Home"
        static let InstructorProfile = "Profile"
        static let InstructorCourses = "Courses"
        
        static let Settings = "Settings"
    }
    
    enum TabImageName {
        static let studentHome = "house"
        static let studentOfferings = "book"
        static let studentProfile = "person.crop.circle"
        
        static let instructorHome = "house"
        static let instructorCourses = "book.fill"
        static let instructorProfile = "person.crop.circle"
        
        static let settings = "gearshape"
    }
    
    enum AuthServiceError{
        static let wrongPassword = "Incorrect email or password"
        static let userNotFound = "No user found for this email"
        static let emailTaken = "This email is already registered"
    }
    
    enum AuthViewModelError{
        static let selectUni = "Please select a university."
    }
    
}

