//
//  AppStrings.swift
//  Institute_SwiftUI
//
//  Created by Ali Mansour on 24/11/2025.
//

enum AppStrings{
    enum Welcome{
        static let Welcome = "Welcome"
        static let WelcomeSubtitle = "Institute SwiftUI"
        static let LoginButton = "Login"
        static let WelcomeImg = "Welcome"
    }
    
    enum AdminTab{
        static let Roles = "Roles"
        static let universities = "Places"
        static let courses = "Courses"
        static let statistics = "Statistics"
        static let settings = "Settings"
    }
    enum AdminTabImage{
        static let roles = "person.2.fill"
        static let universities = "globe.fill"
        static let courses = "book.fill"
        static let statistics = "chart.bar.fill"
        static let settings = "gearshape.fill"
    }
    
    enum AdminRoles{
        static let InsUnavailableViewText = "No instructors yet"
        static let InsUnavailableViewDescription = "You can add instructors by clicking the plus button"
        static let InsAddButton = "Add Instructor"
        static let InsButton = "Instructor"
        
        static let StdUnavailableViewText = "No students yet"
        static let StdUnavailableViewDescription = "You can add students by clicking the plus button"
        static let StdAddButton = "Add Student"
        static let StdButton = "Student"
        
        static let MenuLabel = "Roles"
    }
    enum AdminRolesImage{
        static let InsUnavailableViewImage = "person.crop.circle"
        static let InsImage = "person.fill"
        
        static let StdUnavailableViewImage = "person.2.circle"
        static let StdImage = "person"
        
        static let AddButtonImage = "plus"
        static let MenuLabelImage = "list.bullet"
    }
    
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
    
    enum LoginSignupViewModelError{
        static let emptyFields = "Please fill in all the fields."
        static let unexpectedError = "An unexpected error occurred."
        static let selectUniversity = "Please select a university."
        static let invalidEmail = "Please enter a valid email."
        static let weakPassword = "Password must be at least 8 characters, contain a number, uppercase letter, and special character."
    }
    enum LoginView{
        static let title = "Login"
        static let email = "Email"
        static let password = "Password"
        static let signInButton = "Sign In"
    }
    
    enum SignupView{
        static let InsTitle = "Sign Up an Instructor"
        static let StdTitle = "Sign Up a Student"
        static let fname = "First Name"
        static let lname = "Last Name"
        static let phone = "Phone"
        static let email = "Email"
        static let password = "Password"
        static let uniSelect = "Select a university"
        static let createButton = "Create Account"
    }
    
}

